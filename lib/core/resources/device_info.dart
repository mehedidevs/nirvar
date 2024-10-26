import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import '../../injection_container.dart';
import '../../screens/utils/helper.dart';
import '../constants/app_contstants.dart';

Future<Map<String, String>> getDeviceDetails() async {
  DeviceInfoPlugin deviceInfo = sl<DeviceInfoPlugin>();
  DeviceType deviceType = DeviceType.Unknown;
  String deviceId = 'unknown';

  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceId = androidInfo.id ?? 'unknown'; // Device ID
    deviceType = DeviceType.Android;
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    deviceId = iosInfo.identifierForVendor ?? 'unknown'; // Device ID
    deviceType = DeviceType.iOS;
  }

  return {
    AppConstants.deviceIdKey: deviceId,
    AppConstants.deviceTypeKey: deviceType.name,
  };
}

String getDeviceType() {
  if (Platform.isAndroid) {
    return DeviceType.Android.name;
  } else if (Platform.isIOS) {
    return DeviceType.iOS.name;
  }
  return DeviceType.Unknown.name;
}

