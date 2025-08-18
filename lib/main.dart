import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testflutter/routes/pages.dart';
import 'package:testflutter/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Football App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal), // ganti warna tema
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.loginPage,
      getPages: AppPages.pages,
    );
  }
}
