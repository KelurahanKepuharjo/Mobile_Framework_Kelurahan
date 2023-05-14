// import 'dart:async';
// import 'dart:ui';

// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_background_service/flutter_background_service.dart';
// import 'package:flutter_background_service_android/flutter_background_service_android.dart';
// import 'package:kepuharjo_framework/Auth/Auth_services.dart';
// import 'package:kepuharjo_framework/Services/api_services.dart';
// import 'package:kepuharjo_framework/Services/notifikasi_services.dart';

// Future<void> initializeService() async {
//   final service = FlutterBackgroundService();
//   await service.configure(
//       iosConfiguration: IosConfiguration(
//           autoStart: true,
//           onForeground: onStart,
//           onBackground: onIosBackground),
//       androidConfiguration: AndroidConfiguration(
//           onStart: onStart, isForegroundMode: true, autoStart: true));
//   service.startService();
//   Timer.periodic(Duration(minutes: 1), (timer) {
//     getData();
//   });
// }

// void getData() async {
//   final auth = AuthServices();
//   final user = await auth.me();
//   final rt = user?.masyarakat?.kks?.rt?.toString() ?? '';
//   final allData = await ApiServices().getAllData(rt);
//   print(allData);
// }

// @pragma('vm:entry-point')
// Future<bool> onIosBackground(ServiceInstance serviceInstance) async {
//   WidgetsFlutterBinding.ensureInitialized();
//   DartPluginRegistrant.ensureInitialized();
//   return true;
// }

// @pragma('vm:entry-point')
// void onStart(ServiceInstance serviceInstance) async {
//   DartPluginRegistrant.ensureInitialized();
//   await NotificationServices().initNotification();
//   if (serviceInstance is AndroidServiceInstance) {
//     serviceInstance.on('setAsForeground').listen((event) {
//       serviceInstance.setAsForegroundService();
//     });
//     serviceInstance.on('setAsBackground').listen((event) {
//       serviceInstance.setAsBackgroundService();
//     });
//     serviceInstance.on('stopService').listen((event) {
//       serviceInstance.stopSelf();
//     });
//   }
// }
