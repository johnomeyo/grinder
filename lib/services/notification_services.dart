import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart'; // For Android 13+

class NotificationService {
  final notificationsPlugin = FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;
  bool get isIniatialized => _isInitialized;

  // Request Notification Permission for Android 13+
  Future<void> requestPermissions() async {
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }
  }

  // Initialize Notifications
  Future<void> initNotification() async {
    if (_isInitialized) return;

    await requestPermissions(); // Request Notification Permission (Android 13+)

    const initSettingsAndroid = AndroidInitializationSettings('@drawable/appicon');

    const initSettingsIos = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: initSettingsAndroid,
      iOS: initSettingsIos,
    );

    await notificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        print("Notification Tapped: ${response.payload}");
      },
    );

    _isInitialized = true;
  }

  // Notification details setup
  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'weekly_channel_id', "Weekly Notifications",
        channelDescription: "Weekly Notification Channel",
        importance: Importance.max,
        priority: Priority.max,
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  // Show notification
  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
  }) async {
    try {
      await notificationsPlugin.show(id, title, body, notificationDetails());
      print("Notification Sent: $title - $body");
    } catch (e) {
      print("Error Sending Notification: $e");
    }
  }
}
