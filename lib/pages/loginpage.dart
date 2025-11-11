import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testflutter/controllers/logincontroller.dart';
import 'package:testflutter/routes/routes.dart';
import '../widgets/CustomButton.dart';
import '../widgets/mytextfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Transform.scale(
          scale: 0.9,
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/images/Photo_Bayu Satria Susanto.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              MyTextField(
                textEditingController: controller.usernameController,
                labelText: 'Username',
              ),
              const SizedBox(height: 12),
              MyTextField(
                textEditingController: controller.passwordController,
                labelText: 'Password',
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Login',
                textColor: Colors.white,
                background: Colors.blue,
                onPressed: () {
                  controller.login();
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Register',
                textColor: Colors.white,
                background: Colors.green,
                onPressed: () {
                  Get.offAllNamed(AppRoutes.registerPage);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
