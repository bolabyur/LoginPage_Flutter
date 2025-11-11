import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class NotificationController extends GetxController {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  // 🟢 Observable untuk pesan terakhir
  var lastMessage = "Waiting for messages...".obs;

  // 🟢 Observable untuk token FCM
  var token = "".obs;

  // 🟢 Logger untuk debug
  var logger = Logger(printer: PrettyPrinter());

  @override
  void onInit() {
    super.onInit();
    _initFCM(); // 🔥 Inisialisasi FCM saat controller dibuat
  }

  Future<void> _initFCM() async {
    // 1️⃣ Minta izin notifikasi (Android 13+ & iOS)
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    logger.d("🔔 Permission: ${settings.authorizationStatus}");

    // 2️⃣ Ambil token FCM untuk device ini
    token.value = await _messaging.getToken() ?? "No token";
    logger.d("📱 Token: ${token.value}");

    // 3️⃣ Listener notifikasi saat app aktif (foreground)
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      logger.d("📨 Foreground message: ${message.notification?.title}");

      // Update lastMessage untuk UI
      lastMessage.value =
          "${message.notification?.title ?? 'No title'}\n${message.notification?.body ?? 'No body'}";

      // Tampilkan Snackbar di emulator
      Get.snackbar(
        message.notification?.title ?? 'New Notification',
        message.notification?.body ?? 'No message body',
        backgroundColor: Colors.teal.shade600,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 4),
        margin: const EdgeInsets.all(10),
      );
    });

    // 4️⃣ Listener saat notifikasi diklik / app dibuka dari background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      logger.d("📲 Opened from background");
      lastMessage.value =
          "Opened: ${message.notification?.title ?? 'No title'}";
    });
  }
}
