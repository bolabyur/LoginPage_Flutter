import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testflutter/controllers/logincontroller.dart';
import 'package:testflutter/widgets/row.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Avatar + Nama
                CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage(
                    'assets/images/Photo_Bayu Satria Susanto.jpg',
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Bayu Satria Susanto',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'bayu@example.com',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 30),

                // Card Info
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                        "Profile Information",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 12),
                      InfoRow(icon: "📍", label: "Alamat", value: "Jakarta, Indonesia"),
                      SizedBox(height: 8),
                      InfoRow(icon: "📱", label: "Phone", value: "+62 812-3456-7890"),
                      SizedBox(height: 8),
                      InfoRow(icon: "🎓", label: "Status", value: "Pelajar SMK"),
                    ],
                  ),
                ),
              ),

              const Spacer(),

              // Tombol Logout
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    loginController.logout();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Logout",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
