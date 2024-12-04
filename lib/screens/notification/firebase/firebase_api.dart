import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nirvar/data/preference/token_storage.dart';
import 'package:nirvar/data/preference/user_id_storage.dart';
import 'package:nirvar/routes/routes_name.dart';
import '../../../injection_container.dart';
import '../../../main.dart';

class FirebaseApi {
  final FirebaseMessaging _firebaseMessaging = sl<FirebaseMessaging>();
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  // Initialize FlutterLocalNotificationsPlugin
  Future<void> initLocalNotifications(RemoteMessage message) async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();

    final settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (response) {
        handleNotificationAction(message.data);
        print('Notification payload: ${response.payload}');
      },
    );
  }

  // Initialize Firebase Messaging and Notification Handlers
  Future<void> initNotification() async {
    try {
      // Request notification permissions
      await _firebaseMessaging.requestPermission();

      // Get FCM Token for debugging
      final fcmToken = await _firebaseMessaging.getToken();
      if (fcmToken != null) {
        print('FCM Token: $fcmToken');
      } else {
        print('Failed to get FCM Token');
      }

      // Setup notification handlers
      setupNotificationHandler();
    } catch (e) {
      print('Error during notification initialization: $e');
    }
  }

  // Notification Handlers
  void setupNotificationHandler() async {
    // Foreground Notification Handling
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      final notification = message.notification;
      final android = message.notification?.android;

      if (notification != null && android != null && Platform.isAndroid) {
        await initLocalNotifications(message);
        await showNotification(message);
      }

      if (kDebugMode) {
        print("Foreground Notification: ${notification?.title}");
        print("Data: ${message.data}");
      }
    });
    await setupInteractMessage();
  }

  //handle tap on notification when app is in background or terminated
  Future<void> setupInteractMessage()async{
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleNotificationAction(event.data);
    });
  }

  Future<void> setupInteractMessageWhenTerminated()async{
    // when app is terminated
    final initialMessage = await _firebaseMessaging.getInitialMessage();
    if(initialMessage != null){
      handleNotificationAction(initialMessage.data);
    }
  }


  // Show Notification in Foreground
  Future<void> showNotification(RemoteMessage message) async {
    final channel = AndroidNotificationChannel(
      'high_importance_channel', // Must match the Firebase channel
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.max,
      playSound: true,
    );

    final androidDetails = AndroidNotificationDetails(
      channel.id,
      channel.name,
      channelDescription: channel.description,
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
      sound: channel.sound,
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    final notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    _flutterLocalNotificationsPlugin.show(
      message.hashCode,
      message.notification?.title,
      message.notification?.body,
      notificationDetails,
    );
  }

  // Handle Notification Action
  static Future<void> handleNotificationAction(Map<String, dynamic> data) async {
    final String? action = data['action'];
    final String? identifier = data['unique_identifier'];

    final tokenStorage = sl<TokenStorage>();
    final userIdStorage = sl<UserIdStorage>();

    final bearerToken = await tokenStorage.getToken();
    final userId = await userIdStorage.getUserID();

    if (bearerToken == null || bearerToken.isEmpty || userId == null) {
      print('User not authenticated. Redirecting to Sign-In screen.');
      navigatorKey.currentState?.pushNamed(RoutesName.signInScreen);
      return;
    }

    if (action != null && action.contains('complete') && identifier != null) {
      if (identifier.contains('weekly_report_diabetes')) {
        navigatorKey.currentState?.pushNamed(RoutesName.bloodGlucoseBottomSheet);
      } else if (identifier.contains('weekly_report_blood_pressure')) {
        navigatorKey.currentState?.pushNamed(RoutesName.bloodPressureBottomSheet);
      }
    } else {
      navigatorKey.currentState?.pushNamed(RoutesName.splashScreen);
    }
  }

}
