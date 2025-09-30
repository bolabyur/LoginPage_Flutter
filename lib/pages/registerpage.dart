import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/routes.dart';
import '../widgets/CustomButton.dart';
import '../widgets/MyTextField.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxString gender = ''.obs;
  final Rx<DateTime?> birthDate = Rx<DateTime?>(null);

  void showSnack(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Register',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
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
                textEditingController: nameController,
                labelText: 'Nama' ,
              ),
              const SizedBox(height: 12),
              MyTextField(
                textEditingController: emailController,
                labelText: 'Email / Username',
              ),
              const SizedBox(height: 12),
              MyTextField(
                textEditingController: passwordController,
                labelText: 'Password',
              ),
              const SizedBox(height: 12),
              Obx(
                () => DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Jenis Kelamin'),
                  value: gender.value.isEmpty ? null : gender.value,
                  items: const [
                    DropdownMenuItem(
                      value: 'Laki-laki',
                      child: Text('Laki-laki'),
                    ),
                    DropdownMenuItem(
                      value: 'Perempuan',
                      child: Text('Perempuan'),
                    ),
                  ],
                  onChanged: (value) => gender.value = value ?? '',
                ),
              ),
              const SizedBox(height: 12),
              Obx(
                () => ListTile(
                  title: Text(
                    birthDate.value == null
                        ? 'Tanggal Lahir'
                        : 'Tanggal Lahir: ${birthDate.value!.day}/${birthDate.value!.month}/${birthDate.value!.year}',
                  ),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2005),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null) birthDate.value = picked;
                  },
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Register',
                textColor: Colors.white,
                background: Colors.green,
                onPressed: () {
                  if (nameController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      passwordController.text.isEmpty ||
                      gender.value.isEmpty ||
                      birthDate.value == null) {
                    showSnack(context, 'Harap diisi semua', Colors.red);
                  } else {
                    showSnack(context, 'Register Berhasil', Colors.green);
                    Get.offNamed(AppRoutes.loginPage); // langsung ke LoginPage
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
