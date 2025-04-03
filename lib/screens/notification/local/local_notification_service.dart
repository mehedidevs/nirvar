import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import '../../utils/helper.dart';

class LocalNotificationService {
  static final LocalNotificationService _instance = LocalNotificationService._internal();

  factory LocalNotificationService() => _instance;

  LocalNotificationService._internal();

  /// Initializes notifications.
  Future<void> initialize() async {
    try {
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
            enableLights: true,
            enableVibration: true,
            channelShowBadge: false,
          ),
        ],
      );

      // Handle permission without blocking the app
      await handleNotificationPermission();
    } catch (e) {
      debugPrint("Error initializing notifications: $e");
    }
  }

  /// Handles notification permission
  Future<void> handleNotificationPermission() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();

    if (!isAllowed) {
      isAllowed = await AwesomeNotifications().requestPermissionToSendNotifications();
    }

    if (isAllowed) {
      await scheduleDailyNotifications();
    }
  }


  /// Schedules daily notifications.
  Future<void> scheduleDailyNotifications() async {

    // var now = DateTime.now();
    // var startingReminderTime = DateTime(now.year, now.month, now.day, 10); // 10 AM today
    // var endingReminderTime = DateTime(now.year, now.month, now.day, 22); // 10 PM today
    //
    // if(now.isAtSameMomentAs(startingReminderTime)){
    //   await scheduleDailyNotification(hour: 10, minute: 0,notificationId: 11);
    // }
    //
    // if(now.isAtSameMomentAs(endingReminderTime) ){
    //   await scheduleDailyNotification(hour: 22, minute: 0,notificationId: 21);
    // }

    await scheduleDailyNotification(hour: 10, minute: 0,notificationId: 11);
    await scheduleDailyNotification(hour: 22, minute: 0,notificationId: 21);

  }

  /// Schedules a specific notification time.
  Future<void> scheduleDailyNotification({required int hour, required int minute, required  int notificationId}) async {
    // int notificationId = hour * 100 + minute; // Unique ID based on time

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: notificationId,
        channelKey: 'basic_channel',
        title: 'Health Reminder',
        body: getRandomHealthMessage(),
        notificationLayout: NotificationLayout.Default,
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

  /// Cancels all notifications.
  Future<void> cancelAllNotifications() async {
    await AwesomeNotifications().cancelAll();
  }

  /// Checks permission on app launch and schedules notifications if granted.
  Future<void> checkPermissionOnStartup() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (isAllowed) {
      await scheduleDailyNotifications();
    }
  }

  /// Shows a basic notification.
  Future<void> showBasicNotification({
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

  /// Shows a notification with an image.
  Future<void> showBasicNotificationWithImage({
    required String title,
    required String body,
    required String imageUrl,
  }) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: DateTime.now().millisecondsSinceEpoch.remainder(100000), // Unique ID
        channelKey: 'basic_channel',
        title: title,
        body: body,
        bigPicture: imageUrl,
        largeIcon: imageUrl,
        notificationLayout: NotificationLayout.BigPicture,
      ),
    );
  }

}
