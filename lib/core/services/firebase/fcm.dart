// import 'dart:io';
//
// Future<void> handleBackgroundMessage(RemoteMessage message) async {}
//
// class PushNotificationService {
//   final _fcm = FirebaseMessaging.instance;
//   String? fCMToken;
//
//   // final _androidChannel = const AndroidNotificationChannel(
//   //   'high_importance_channel',
//   //   'High Importance Notifications',
//   //   description: "This channel is used for important notifications",
//   //   importance: Importance.defaultImportance,
//   // );
//   final _localNotifications = FlutterLocalNotificationsPlugin();
//   void handleMessage(RemoteMessage? message) {
//     if (message == null) {
//       return;
//     } else {}
//   }
//
//   Future initLocalNotifications() async {
//     const android = AndroidInitializationSettings('@drawable/ic_launcher');
//     const settings = InitializationSettings(android: android);
//
//     await _localNotifications.initialize(
//       settings,
//     );
//   }
//
//   Future initPushNotifications() async {
//     await _fcm.requestPermission();
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//
//     FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
//     FirebaseMessaging.onMessage.listen((event) {
//       final notification = event.notification;
//       if (notification == null) return;
//       notificationSnackBar(
//           context: AppConstants.navigatorKey.currentContext!,
//           message: notification.title,
//           event: event);
//     });
//   }
//
//   Future<void> initialize() async {
//     // var androidInitialize =
//     //     const AndroidInitializationSettings('notification_icon');
//     // var iOSInitialize = const DarwinInitializationSettings();
//     // var initializationsSettings =
//     //     InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
//     if (Platform.isAndroid) {
//       _localNotifications
//           .resolvePlatformSpecificImplementation<
//               AndroidFlutterLocalNotificationsPlugin>()!
//           .requestNotificationsPermission();
//     }
//     if (Platform.isIOS) {
//       _localNotifications
//           .resolvePlatformSpecificImplementation<
//               IOSFlutterLocalNotificationsPlugin>()!
//           .requestPermissions(
//             alert: true,
//             badge: true,
//             provisional: false,
//             sound: true,
//           )
//           .then((value) async {
//         await FirebaseMessaging.instance
//             .setForegroundNotificationPresentationOptions(
//           alert: true,
//           badge: true,
//           sound: true,
//         );
//       });
//     }
//     await _fcm.requestPermission();
//     await _fcm.getAPNSToken();
//     await Future.delayed(const Duration(seconds: 2));
//     fCMToken = await _fcm.getToken();
//     await CacheHelper.saveData(key: CacheKeys.deviceToken, value: fCMToken);
//     await initPushNotifications();
//   }
// }
