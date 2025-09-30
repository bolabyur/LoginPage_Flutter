import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:testflutter/controllers/splashscreen_controller.dart';

class SplashScreenPage extends StatelessWidget {
  SplashScreenPage({super.key});

  final controller = Get.find<SplashscreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo atau Icon aplikasi
            CircleAvatar(
              radius: 48,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.flutter_dash,
                size: 60,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 24),
            // Judul aplikasi
            Text(
              'Splash Screen',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 16),
            // Deskripsi singkat
            Text(
              'Selamat datang di aplikasi Anda!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 32),
            // Animasi loading
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}