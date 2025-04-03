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

  /// Initializes Firebase Messaging and Notification Handlers
  Future<void> initNotification() async {
    try {
      NotificationSettings settings = await _firebaseMessaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.denied) {
        print("🔴 Notification permission denied.");
        return; // Stop execution if permissions are denied
      }

      if (settings.authorizationStatus == AuthorizationStatus.authorized ||
          settings.authorizationStatus == AuthorizationStatus.provisional) {
        print("✅ Notification permission granted.");
        await _setupNotificationHandlers();
      }
    } catch (e) {
      print('⚠️ Error initializing notifications: $e');
    }
  }

  /// Listens for Permission Changes
  void listenForPermissionChanges() {
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
      print("🔄 Token refreshed, checking permissions again...");
      await initNotification(); // Reinitialize if permission was granted later
    });
  }

  /// Sets up foreground and background notification handlers
  Future<void> _setupNotificationHandlers() async {
    // Handle foreground notifications
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      if (await _isPermissionGranted()) {
        await _showNotification(message);
      }
      if (kDebugMode) {
        print("📩 Foreground Notification: ${message.notification?.title}");
      }
    });

    // Handle notification tap when the app is in background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleNotificationAction(message.data);
    });

    // Handle notification tap when the app is terminated
    await _handleInitialMessage();
  }

  /// Checks if notification permissions are granted
  Future<bool> _isPermissionGranted() async {
    NotificationSettings settings = await _firebaseMessaging.getNotificationSettings();
    return settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional;
  }

  /// Handles the case when the app is opened via a notification tap after being terminated
  Future<void> _handleInitialMessage() async {
    RemoteMessage? initialMessage = await _firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      _handleNotificationAction(initialMessage.data);
    }
  }

  /// Displays a local notification
  Future<void> _showNotification(RemoteMessage message) async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();
    final settings = InitializationSettings(android: androidSettings, iOS: iosSettings);

    await _flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (response) {
        _handleNotificationAction(message.data);
        print('🔔 Notification payload: ${response.payload}');
      },
    );

    final channel = AndroidNotificationChannel(
      'high_importance_channel',
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
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    final notificationDetails = NotificationDetails(android: androidDetails, iOS: iosDetails);

    await _flutterLocalNotificationsPlugin.show(
      message.hashCode,
      message.notification?.title,
      message.notification?.body,
      notificationDetails,
    );
  }

  //handle tap on notification when app is in background or terminated
  Future<void> setupInteractMessage()async{
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      _handleNotificationAction(event.data);
    });
  }

  Future<void> setupInteractMessageWhenTerminated()async{
    // when app is terminated
    final initialMessage = await _firebaseMessaging.getInitialMessage();
    if(initialMessage != null){
      _handleNotificationAction(initialMessage.data);
    }
  }

  /// Handles notification actions (navigating to specific screens)
  static Future<void> _handleNotificationAction(Map<String, dynamic> data) async {
    final String? action = data['action'];
    final String? identifier = data['unique_identifier'];

    final tokenStorage = sl<TokenStorage>();
    final userIdStorage = sl<UserIdStorage>();

    final bearerToken = await tokenStorage.getToken();
    final userId = await userIdStorage.getUserID();

    if (bearerToken == null || bearerToken.isEmpty || userId == null) {
      print('🔐 User not authenticated. Redirecting to Sign-In screen.');
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
