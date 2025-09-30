import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testflutter/routes/routes.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login()async {
    if(usernameController.text == 'admin' && passwordController.text == 'admin'){
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('username', usernameController.text.toString());
      Get.offAllNamed(AppRoutes.homePage);
    }
  }
  logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('username');
    Get.offAllNamed(AppRoutes.loginPage);
  }
}