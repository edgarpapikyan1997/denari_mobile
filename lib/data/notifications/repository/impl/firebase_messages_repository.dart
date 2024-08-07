
import 'package:denari_app/data/notifications/model/notification.dart';
import 'package:denari_app/data/notifications/repository/messages_repository.dart';
import 'package:denari_app/firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagesRepository implements MessagesRepository {
  static const String key = 'notifications';
  static const String keyTokens = 'tokens';

  late final FirebaseDatabase _database;
  late final DatabaseReference _ref;

  FirebaseMessagesRepository() {
    _database = FirebaseDatabase.instanceFor(
      app: FirebaseDatabase.instance.app,
      databaseURL: DefaultFirebaseOptions.currentPlatform.databaseURL,
    );
    _ref = _database.ref();
  }

  @override
  Future<void> requestPermissions() async {
    final settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    // handle user's denial
    if (settings.authorizationStatus != AuthorizationStatus.authorized) {
      return;
    }
  }

  @override
  Future<String?> getToken() => FirebaseMessaging.instance.getToken();

  @override
  Stream<String> getOnTokenRefresh() =>
      FirebaseMessaging.instance.onTokenRefresh;

  @override
  Future<void> deleteToken() => FirebaseMessaging.instance.deleteToken();

  @override
  Future<RemoteMessage?> getInitialMessage() =>
      FirebaseMessaging.instance.getInitialMessage();

  @override
  Stream<RemoteMessage> getMessageOpenedApp() =>
      FirebaseMessaging.onMessageOpenedApp.asBroadcastStream();

  @override
  Stream<RemoteMessage> getMessageForeground() => FirebaseMessaging.onMessage;

  @override
  void getMessageBackground(
      Future<void> Function(RemoteMessage message) handler) =>
      FirebaseMessaging.onBackgroundMessage(handler);

  @override
  Stream<DatabaseEvent> getNotificationStream() => _ref.child(key).onValue;

  @override
  Future<void> updateNotification(Notification notification) async =>
      await _ref.child('$key/${notification.id}').update(notification.toJson());

  @override
  Future<void> deleteNotifications() async => await _ref.child(key).remove();

  @override
  Future<void> deleteNotification(Notification notification) async =>
      await _ref.child('$key/${notification.id}').remove();

  @override
  Future<void> saveTokenToDatabase(
      String user,
      String platform,
      String token,
      ) async {
    await _ref.child('$keyTokens/$user').update({platform: token});
  }
}