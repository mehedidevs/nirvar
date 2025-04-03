import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nirvar/screens/notification/firebase/firebase_api.dart';
import 'package:nirvar/screens/notification/local/local_notification_service.dart';
import 'package:nirvar/screens/utils/helper.dart';
import 'app.dart';
import 'injection_container.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDependencies();
  await _localNotificationSetup();
  await _firebasePushNotificationSetup();
  statusBarSetup();
  runApp(const NirvarApp());
}


Future<void> _firebasePushNotificationSetup() async {
  await FirebaseApi().initNotification();
  FirebaseApi().listenForPermissionChanges();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

Future<void> _localNotificationSetup() async {
  final notificationService = LocalNotificationService();
  await notificationService.initialize();
  await notificationService.checkPermissionOnStartup();
}

//Testing Started


