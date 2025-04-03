import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

import '../../injection_container.dart';

class BloodGlucoseStatusStorage {
  static const String _statusKey = 'blood_glucose_status'; // Key for storing status
  static const String _timestampKey = 'blood_glucose_timestamp'; // Key for storing timestamp

  /// Save the status and timestamp (if status is 1)
  Future<void> saveStatus(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_statusKey, id);

    if (id == 1) {
      // Store timestamp when setting "After Meal"
      String timestamp = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
      await prefs.setString(_timestampKey, timestamp);
    }
  }

  /// Get the stored status
  Future<int?> getStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_statusKey);
  }

  /// Get the timestamp of the last "After Meal" status
  Future<String?> getLastTimestamp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_timestampKey);
  }

  /// Clear the status
  Future<void> clearStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_statusKey);
    await prefs.remove(_timestampKey);
  }
}


Future<String> getHint() async {
  BloodGlucoseStatusStorage storage = sl<BloodGlucoseStatusStorage>();

  int? status = await storage.getStatus();
  String? timestamp = await storage.getLastTimestamp();

  if (status == 1 && timestamp != null) {
    // Convert timestamp to DateTime
    DateTime lastUpdate = DateFormat('yyyy-MM-dd HH:mm:ss').parse(timestamp);
    DateTime now = DateTime.now();

    // If the current time is after 7 AM and the last update was before today, reset to "Before Meal"
    if (now.hour >= 7 && lastUpdate.day != now.day) {
      await storage.saveStatus(0); // Reset to "Before Meal"
      return 'Before Meal';
    }
    return 'After Meal';
  }

  return 'Before Meal'; // Default case
}
