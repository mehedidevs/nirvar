import 'package:flutter/material.dart';
import 'package:nirvar/screens/notification/firebase/firebase_api.dart';
import 'package:nirvar/screens/notification/local/local_notification_service.dart';
import 'app.dart';
import 'injection_container.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await LocalNotificationService.initialize();
  await FirebaseApi().initNotification();
  await initializeDependencies();
  runApp(const NirvarApp());
}

//Testing Started


