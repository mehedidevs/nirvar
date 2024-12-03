import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:nirvar/data/preference/token_storage.dart';
import 'package:nirvar/data/preference/user_id_storage.dart';
import 'package:nirvar/screens/auth/sign_in_screen.dart';
import 'package:nirvar/screens/notification/notification_screen.dart';
import '../../../injection_container.dart';
import '../../../main.dart';

class FirebaseApi {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    try {
      // Request notification permissions
      await _firebaseMessaging.requestPermission();

      // Get the FCM token and log it for debugging purposes
      final fCMToken = await _firebaseMessaging.getToken();
      if (fCMToken == null) {
        print('Failed to get FCM token');
      } else {
        print('FCM TOKEN: $fCMToken');
      }

      // Set up notification handlers
      setupNotificationHandler();
    } catch (e) {
      print('Error during notification initialization: $e');
    }
  }

  void setupNotificationHandler() {
    // Foreground message handler
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Message received: ${message.notification?.title}');
      if (message.data.isNotEmpty) {
        String? action = message.data['action'];
        print('Notification action: $action');
        // Handle specific actions if needed
      }
      handleNotificationTap();
    });

    // Background/terminated message handler
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print('Notification tapped: ${message.notification?.title}');

    });

    // Handle messages when the app is in a terminated state
    FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
  }

  // Background message handler for terminated state
  Future<void> backgroundMessageHandler(RemoteMessage message) async {
    print('Handling background message: ${message.notification?.title}');
    await handleNotificationTap();
  }


  static Future<void> handleNotificationTap() async {

    TokenStorage tokenStorage = sl<TokenStorage>();
    UserIdStorage userIdStorage = sl<UserIdStorage>();

     String? bearerToken =  await tokenStorage.getToken();
     int? userId = await userIdStorage.getUserID();

    if (bearerToken != null && bearerToken.isNotEmpty && userId != null) {
      // Navigate to Notification Details Page
      print('Navigating to Notification Details Page');
      navigatorKey.currentState?.pushReplacement(
        MaterialPageRoute(builder: (context) => NotificationScreen(isComingFromNotification: true)),
      );
    } else {
      // Navigate to Login Page
      print('Bearer token or User ID is missing. Redirecting to Sign-In.');
      navigatorKey.currentState?.pushReplacement(
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    }
  }
}
