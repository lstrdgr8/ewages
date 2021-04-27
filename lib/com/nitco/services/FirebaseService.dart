
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseService {

  FirebaseMessaging firebaseMessaging;

  String notificationAlert = "";

  String topic;

  /// initialize tokens
  FirebaseService({required this.firebaseMessaging, required this.topic}) {
    firebaseMessaging.subscribeToTopic('all');
    firebaseMessaging.getToken().then((token) => print('token: $token'));
  }

  /// Receive message from Firebase App
  void onMessage() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification!;
      notificationAlert = notification.body!;
      print("notificationAlert: $notificationAlert");
    });
  }

  void onMessageOpen() async {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {

    });
  }

  /// Get the notificationList.json alert from Firebase App
  Future<String> getNotificationBody() async {
    print('notificationList.json alert: ' + notificationAlert);
    return notificationAlert;
  }
}