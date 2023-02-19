// import 'package:firebase_messaging/firebase_messaging.dart';
//
// class PushNotificationService {
//   FirebaseMessaging _firebaseMessaging;
//
//   void init() {
//     _firebaseMessaging = FirebaseMessaging();
//     _firebaseMessaging.requestNotificationPermissions();
//     _firebaseMessaging.configure();
//
//     _firebaseMessaging.onMessage = (Map<String, dynamic> message) async {
//       print("onMessage: $message");
//     };
//
//     _firebaseMessaging.onResume = (Map<String, dynamic> message) async {
//       print("onResume: $message");
//     };
//   }
// }