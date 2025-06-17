import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

import '../notification_service/notification_service.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint("🔁 Background Message ID: ${message.messageId}");
}

class FirebaseService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  /// Call this from main() or your service initialization
  Future<String> init() async {
    await Firebase.initializeApp();

    // Request permissions (for iOS)
    await _messaging.requestPermission();

    // Get and print FCM token
    String? token = await _messaging.getToken();
    debugPrint("📲 FCM Token: $token");

    // Foreground message handler
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      NotificationService.showLocalNotification(message);
      debugPrint("📩 Foreground: ${message.notification?.title}");
    });

    // When notification is tapped and opens the app
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint("📲 App opened from notification!");
    });
    return token!;
  }
}
