import 'package:flutter/material.dart';
import 'package:nirvar/screens/notification/firebase/firebase_api.dart';
import 'app.dart';
import 'injection_container.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDependencies();
  await FirebaseApi().initNotification();
  runApp(const NirvarApp());
}

//Testing Started


