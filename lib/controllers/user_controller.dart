import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testflutter/main.dart';
import '../models/user.dart';

class UserController extends GetxController {
  var user = User().obs;

  void main() {
    Get.put(UserController()); // inisialisasi controller
    runApp(const MyApp());
  }

  void setUser(User newUser) {
    user.value = newUser;
  }
}
