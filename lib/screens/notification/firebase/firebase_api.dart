import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:nirvar/data/preference/token_storage.dart';
import 'package:nirvar/data/preference/user_id_storage.dart';
import 'package:nirvar/routes/routes_name.dart';
import '../../../injection_container.dart';
import '../../../main.dart';

class FirebaseApi {
  final FirebaseMessaging _firebaseMessaging = sl<FirebaseMessaging>();

  Future<void> initNotification() async {
    try {
      // Request notification permissions
      await _firebaseMessaging.requestPermission();

      // Get the FCM token for debugging
      final fCMToken = await _firebaseMessaging.getToken();
      if (fCMToken != null) {
        print('FCM TOKEN: $fCMToken');
      } else {
        print('Failed to get FCM token');
      }

      // Set up notification handlers
      setupNotificationHandler();
    } catch (e) {
      print('Error during notification initialization: $e');
    }
  }

  void setupNotificationHandler() {
    // Foreground notifications
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Foreground notification received: ${message.notification?.title}');
      if (message.data.isNotEmpty) {
        print(message.data.toString());
      }
      _handleNotificationAction(message.data);
    });

    // Background notifications (app in background or terminated)
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Notification tapped: ${message.notification?.title}');
      if (message.data.isNotEmpty) {
        _handleNotificationAction(message.data);
      }
    });

    // Handle background messages (terminated state)
    FirebaseMessaging.onBackgroundMessage(_backgroundMessageHandler);
  }

  static Future<void> _backgroundMessageHandler(RemoteMessage message) async {
    print('Handling background message: ${message.notification?.title}');
    if (message.data.isNotEmpty) {
      await _handleNotificationAction(message.data);
    }
  }

  static Future<void> _handleNotificationAction(Map<String, dynamic> data) async {
    final String? action = data['action'];
    final String? identifier = data['unique_identifier'];

    TokenStorage tokenStorage = sl<TokenStorage>();
    UserIdStorage userIdStorage = sl<UserIdStorage>();

    final String? bearerToken = await tokenStorage.getToken();
    final int? userId = await userIdStorage.getUserID();

    if (bearerToken == null || bearerToken.isEmpty || userId == null) {
      print('User not authenticated. Redirecting to Sign-In screen.');
      navigatorKey.currentState?.pushNamed(RoutesName.signInScreen);
      return;
    }

    if(action != null && action.contains('complete') && identifier != null){
      if(identifier.contains('weekly_report_diabetes')){
        navigatorKey.currentState?.pushNamed(RoutesName.bloodGlucoseBottomSheet);
      }
      if(identifier.contains('weekly_report_blood_pressure')){
        navigatorKey.currentState?.pushNamed(RoutesName.bloodPressureBottomSheet);
      }
    }

  }
}
