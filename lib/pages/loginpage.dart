import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/routes.dart';
import '../widgets/CustomButton.dart';
import '../widgets/MyTextField.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
                textEditingController: usernameController,
                labelText: 'Username',
              ),
              const SizedBox(height: 12),
              MyTextField(
                textEditingController: passwordController,
                labelText: 'Password',
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Login',
                textColor: Colors.white,
                background: Colors.blue,
                onPressed: () {
                  final username = usernameController.text.trim();
                  final password = passwordController.text.trim();

                  if (username.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Username dan Password harus diisi'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  if (username == 'admin' && password == 'admin') {
                    Get.offNamed(AppRoutes.homePage);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Username atau Password salah'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 12),
              CustomButton(
                text: 'Register',
                textColor: Colors.white,
                background: Colors.green,
                onPressed: () {
                  Get.toNamed(AppRoutes.registerPage);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
