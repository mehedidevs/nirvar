import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import '../../injection_container.dart';
import '../constants/app_contstants.dart';

class DeviceInformation {
  final int userId;
  final String deviceToken;
  final String deviceId;
  final String deviceType;

  DeviceInformation({
    required this.userId,
    required this.deviceToken,
    required this.deviceId,
    required this.deviceType,
  });

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'device_token': deviceToken,
      'device_id': deviceId,
      'device_type': deviceType,
    };
  }
}


enum DeviceType {
  Android,
  iOS,
  Unknown,
}

extension DeviceTypeExtension on DeviceType {
  String get name {
    switch (this) {
      case DeviceType.Android:
        return 'Android';
      case DeviceType.iOS:
        return 'iOS';
      default:
        return 'Unknown';
    }
  }
}


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


