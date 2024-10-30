import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../injection_container.dart';

class FirebaseApi{

  final _firebaseMessaging = sl<FirebaseMessaging>();


  Future<void> initNotification() async{
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('FCM TOKEN: $fCMToken');
  }

}