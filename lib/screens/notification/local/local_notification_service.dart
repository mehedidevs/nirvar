import 'dart:ui';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:nirvar/screens/utils/helper.dart';



class LocalNotificationService {
  static bool _isInitialized = false;

  static Future<void> initialize() async {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic Notifications',
          channelDescription: 'Notification channel for basic notifications',
          defaultColor: const Color(0xFF6BB5BE),
          ledColor: const Color(0xFF74B192),
          importance: NotificationImportance.High,
          channelShowBadge: true,
        ),
      ],
    );

    // Request permissions for notifications
    await _requestPermission();
    _isInitialized = true;

    if (_isInitialized) {
      //Morning Reminder Notification
      await _scheduleDailyNotification(hour: 10, minute: 0);
      //Evening Reminder Notification
      await _scheduleDailyNotification(hour: 22, minute: 0);
    } else {
      throw Exception(
          'NotificationService is not initialized. Call initialize() first.');
    }
  }

  /// Request permissions for notifications from the user.
  static Future<void> _requestPermission() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
    }
  }

  /// Show a basic notification.
  static Future<void> showBasicNotification({
    required String title,
    required String body,
    String channelKey = 'basic_channel',
    int id = 1,
  }) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: channelKey,
        title: title,
        body: body,
        notificationLayout: NotificationLayout.Default,
      ),
    );
  }

  //Notification with Big Picture
  // Show a basic notification
  static Future<void> showBasicNotificationWithImage({
    required String title,
    required String body,
    required String imageUrl,
  }) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: -1,
        channelKey: 'basic_channel',
        title: title,
        body: body,
        bigPicture: imageUrl,
        largeIcon: imageUrl,
        notificationLayout: NotificationLayout.BigPicture,
      ),
    );
  }

  //Sequence Notification
  static Future<void> _scheduleDailyNotification(
      {required int hour, required int minute}) async {
    int notificationId = hour * 100 + minute; // Unique ID based on time

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: notificationId,
        channelKey: 'basic_channel',
        title: 'Reminder',
        body: getRandomHealthMessage(),
        notificationLayout: NotificationLayout.Default
      ),
      schedule: NotificationCalendar(
        hour: hour,
        minute: minute,
        second: 0,
        repeats: true,
        timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier(),
      ),
    );
  }


  /// Cancel all notifications.
  static Future<void> cancelAllNotifications() async {
    await AwesomeNotifications().cancelAll();
  }
}
