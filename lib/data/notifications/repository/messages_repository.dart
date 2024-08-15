import 'package:firebase_messaging/firebase_messaging.dart';

import '../model/notification.dart';

abstract class MessagesRepository {
  Future<void> requestPermissions();

  Future<String?> getToken();

  Stream<String> getOnTokenRefresh();

  Future<void> deleteToken();

  Stream<RemoteMessage> getMessageOpenedApp();

  void getMessageBackground(
      Future<void> Function(RemoteMessage message) handler);

  Future<RemoteMessage?> getInitialMessage();

  Stream<RemoteMessage> getMessageForeground();

  Stream<List<Notification>> getNotificationStream();

  Future<void> updateNotification(Notification notification);

  Future<void> deleteNotifications();

  Future<void> deleteNotification(Notification notification);

  Future<void> saveTokenToDatabase(String user, String platform, String token);
}
