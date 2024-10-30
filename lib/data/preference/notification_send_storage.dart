import 'package:shared_preferences/shared_preferences.dart';

class NotificationSendStorage {
  static const _isDeviceInfoSentKey = 'isDeviceInfoSent';

  // Save the flag indicating that the device info has been sent
  Future<void> saveNotificationSentStatus(bool isSent) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isDeviceInfoSentKey, isSent);
  }

  // Retrieve the flag indicating if the device info has been sent
  Future<bool> isNotificationSent() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isDeviceInfoSentKey) ?? false;
  }

  // Clear the flag, useful on user logout or when resetting
  Future<void> clearNotificationSentStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_isDeviceInfoSentKey);
  }
}
