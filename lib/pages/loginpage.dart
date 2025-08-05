import 'package:flutter/material.dart';
import 'package:testflutter/widgets/widget_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showSnackbar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            Image.asset(
              'assets/images/Photo_Bayu Satria Susanto.jpg',
              width: 100,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: Center(
                child: CustomButton(
                  text: 'Login',
                  textcolor: Colors.white,
                  onPressed: () {
                    // Handle login logic here
                    _showSnackbar('Login button pressed', Colors.green);
                  },
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: Center(
                child: CustomButton(
                  text: 'Register',
                  textcolor: Colors.white,
                  onPressed: () {
                    // Navigate to Register Page
                    Navigator.pushNamed(context, '/register');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}