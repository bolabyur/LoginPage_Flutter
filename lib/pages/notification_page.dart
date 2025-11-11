import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Untuk Clipboard
import 'package:get/get.dart';
import 'package:testflutter/controllers/notificationcontroller.dart';

class NotificationPage extends StatelessWidget {
  final controller = Get.find<NotificationController>(); // 🔗 Ambil controller

  NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                // 🔔 Icon notifikasi
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.teal.shade200,
                  child: const Icon(
                    Icons.notifications_active,
                    color: Colors.white,
                    size: 40,
                  ),
                ),

                const SizedBox(height: 16),

                // 🏷️ Judul "Last Notification"
                Text(
                  "Last Notification",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade700,
                  ),
                ),
                const SizedBox(height: 10),

                // 🗳️ Kartu pesan terakhir
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.mail_outline,
                          color: Colors.teal.shade600,
                          size: 28,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            controller.lastMessage.value.isEmpty
                                ? "Belum ada pesan diterima."
                                : controller.lastMessage.value,
                            style: const TextStyle(
                              fontSize: 16,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                const Divider(thickness: 1),
                const SizedBox(height: 20),

                // 🧾 Judul Token
                Text(
                  "Device Token",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.teal.shade700,
                  ),
                ),
                const SizedBox(height: 10),

                // 📜 Kartu token
                Card(
                  elevation: 2,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 14),
                    child: SelectableText(
                      controller.token.value.isEmpty
                          ? "Token belum tersedia"
                          : controller.token.value,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // 📋 Tombol salin token
                ElevatedButton.icon(
                  onPressed: () {
                    if (controller.token.value.isNotEmpty) {
                      Clipboard.setData(
                          ClipboardData(text: controller.token.value));
                      Get.snackbar(
                        "Disalin",
                        "Token berhasil disalin ke clipboard!",
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.green.shade100,
                        colorText: Colors.black,
                        duration: const Duration(seconds: 2),
                      );
                    } else {
                      Get.snackbar(
                        "Gagal",
                        "Token belum tersedia untuk disalin.",
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.red.shade100,
                        colorText: Colors.black,
                        duration: const Duration(seconds: 2),
                      );
                    }
                  },
                  icon: const Icon(Icons.copy, size: 18),
                  label: const Text("Salin Token"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal.shade600,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                const Text(
                  "Gunakan token ini untuk mengirim pesan via Firebase Console.",
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
