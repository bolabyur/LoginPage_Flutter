import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Authcontroller extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final gender = ''.obs;
  final birthDate = Rxn<DateTime>();

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    nameController.dispose();
    emailController.dispose();
    registerPasswordController.dispose();
    super.onClose();
  }
}
