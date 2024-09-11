// ignore_for_file: avoid_print
import 'dart:async';
import 'dart:io' show Platform;
import 'package:bloc/bloc.dart';
import 'package:denari_app/data/profile/model/profile_model.dart';
import 'package:denari_app/data/profile/repository/profile_repository.dart';
import 'package:denari_app/utils/log/logging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../../../data/notifications/repository/messages_repository.dart';
import '../../../../data/notifications/model/notification.dart';

abstract class MessagesState {}

class InitialMessagesState extends MessagesState {}

class WorkMessagesState extends MessagesState {
  final String? fcmToken;
  final List<Notification>? notifications;

  WorkMessagesState({required this.fcmToken, this.notifications});
}

class GoToPushPageState extends WorkMessagesState {
  final String route;

  GoToPushPageState(
    this.route, {
    required super.fcmToken,
    super.notifications,
  });
}

class ViewInAppPushState extends WorkMessagesState {
  final String? route;
  final String? title;
  final String? message;

  ViewInAppPushState(
    this.route,
    this.title,
    this.message, {
    required super.fcmToken,
    super.notifications,
  });
}

abstract class MessagesEvent {}

class InitializedMessagesEvent extends MessagesEvent {}

class SubscribeToNotificationsEvent extends MessagesEvent {}

class UnSubscribeNotificationsEvent extends MessagesEvent {}

class UpdateNotificationsEvent extends MessagesEvent {
  final List<Notification>? notifications;

  UpdateNotificationsEvent(this.notifications);
}

class DeleteNotificationsEvent extends MessagesEvent {
  final List<Notification> notifications;

  DeleteNotificationsEvent(this.notifications);
}

class UpdateNotificationEvent extends MessagesEvent {
  final Notification notification;

  UpdateNotificationEvent(this.notification);
}

class DeleteNotificationEvent extends MessagesEvent {
  final Notification notification;

  DeleteNotificationEvent(this.notification);
}

class UninitializedMessagesEvent extends MessagesEvent {}

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  final MessagesRepository _messagesRepository;
  final ProfileRepository _profileRepository;
  String? _fcmToken;
  StreamSubscription<List<Notification>>? _subscriptionNotifications;

  MessagesBloc(
      {required MessagesRepository messagesRepository,
      required ProfileRepository profileRepository})
      : _messagesRepository = messagesRepository,
        _profileRepository = profileRepository,
        super(InitialMessagesState()) {
    on<InitializedMessagesEvent>(_onInitializedNotificationsEvent);
    on<UninitializedMessagesEvent>(_onUninitializedNotificationsEvent);
    on<SubscribeToNotificationsEvent>(_onListenNotifications);
    on<UnSubscribeNotificationsEvent>(_onDisposeNotifications);
    on<UpdateNotificationsEvent>(_updateNotifications);
    on<DeleteNotificationsEvent>(_deleteNotifications);
    on<UpdateNotificationEvent>(_updateNotification);
    on<DeleteNotificationEvent>(_deleteNotification);
  }

  Future<void> _onInitializedNotificationsEvent(
      InitializedMessagesEvent event, Emitter<MessagesState> emit) async {
    emit(InitialMessagesState());
    // Request platform specific permissions.
    await _messagesRepository.requestPermissions();

    // Listen for push-notifications.
    // when entering from a push
    _messagesRepository.getMessageOpenedApp().listen(_handlePushNotification);
    final remoteMessage = await _messagesRepository.getInitialMessage();
    await _handlePushNotification(remoteMessage);
    // with the application open
    _messagesRepository
        .getMessageForeground()
        .listen(_handleInAppPushNotification);

    // Save FCM registration token.
    final token = await _messagesRepository.getToken();
    await _saveDeviceToken(token);

    // Listen for token changes
    _messagesRepository
        .getOnTokenRefresh()
        .listen((token) => _saveDeviceToken(token));

    _fcmToken = token;
    emit(WorkMessagesState(fcmToken: _fcmToken));
  }

  Future<void> _onUninitializedNotificationsEvent(
    UninitializedMessagesEvent event,
    Emitter<MessagesState> emit,
  ) async {
    emit(InitialMessagesState());
    await _messagesRepository.deleteToken();
  }

  Future<void> _handlePushNotification(RemoteMessage? message) async {
    if (message == null) return;
    String? route = message.data['deep_link'];
    if (route != null && route.isNotEmpty) {
      String? fcmToken;
      List<Notification>? notifications;
      if (state is WorkMessagesState) {
        fcmToken = (state as WorkMessagesState).fcmToken;
        notifications = (state as WorkMessagesState).notifications;
      }
      emit(GoToPushPageState(
        route,
        fcmToken: fcmToken,
        notifications: notifications,
      ));
    }
  }

  Future<void> _handleInAppPushNotification(RemoteMessage message) async {
    String? route = message.data['deep_link'];
    String? title = message.notification?.title;
    String? body = message.notification?.body;
    String? fcmToken;
    List<Notification>? notifications;
    if (state is WorkMessagesState) {
      fcmToken = (state as WorkMessagesState).fcmToken;
      notifications = (state as WorkMessagesState).notifications;
    }
    emit(ViewInAppPushState(
      route,
      title,
      body,
      fcmToken: fcmToken,
      notifications: notifications,
    ));
  }

  Future<void> _saveDeviceToken(String? token) async {
    if (token == null) {
      logger.warning('Got `null` as a FCM device token!');
      return;
    }
    ProfileModel? user;
    try {
      user = await _profileRepository.getProfile();
    } catch (e, st) {
      logger.error('Error get user profile!');
    }
    if (user == null) {
      return;
    }
    final platform = Platform.isAndroid ? 'android' : 'ios';
    _messagesRepository.saveTokenToDatabase(user.phone, platform, token);
  }

  void _handleNotificationsUpdate(List<Notification> event) {
    List<Notification> notifications = [];
    if (event.isNotEmpty) {
      notifications = event.reversed.toList(growable: false);
    }
    add(UpdateNotificationsEvent(notifications));
  }

  Future<void> _onListenNotifications(
    SubscribeToNotificationsEvent event,
    Emitter<MessagesState> emit,
  ) async {
    final notificationsStream = _messagesRepository.getNotificationStream();
    _subscriptionNotifications =
        notificationsStream.listen(_handleNotificationsUpdate);
  }

  Future<void> _updateNotifications(
    UpdateNotificationsEvent event,
    Emitter<MessagesState> emit,
  ) async {
    ProfileModel? user;
    try {
      user = await _profileRepository.getProfile();
    } catch (e, st) {
      logger.error('Error get user profile!');
    }
    if (user == null) {
      return;
    }
    List<Notification>? notifications;
    for (var element in event.notifications ?? <Notification>[]) {
      if (element.userId == user.phone) {
        notifications ??= [];
        notifications.add(element);
      }
    }
    emit(WorkMessagesState(
      fcmToken: _fcmToken,
      notifications: notifications,
    ));
  }

  Future<void> _deleteNotifications(
    DeleteNotificationsEvent event,
    Emitter<MessagesState> emit,
  ) async {
    for (var e in event.notifications) {
      await _messagesRepository.deleteNotification(e);
    }
  }

  Future<void> _updateNotification(
    UpdateNotificationEvent event,
    Emitter<MessagesState> emit,
  ) async {
    await _messagesRepository.updateNotification(event.notification);
  }

  Future<void> _deleteNotification(
    DeleteNotificationEvent event,
    Emitter<MessagesState> emit,
  ) async {
    await _messagesRepository.deleteNotification(event.notification);
  }

  Future<void> _onDisposeNotifications(
    UnSubscribeNotificationsEvent event,
    Emitter<MessagesState> emit,
  ) async {
    await _subscriptionNotifications?.cancel();
    _subscriptionNotifications = null;
  }
}
