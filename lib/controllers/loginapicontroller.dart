import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testflutter/models/model_login_api.dart';
import 'package:testflutter/network/client_network.dart';
import 'package:testflutter/routes/routes.dart';

class LoginApiController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isLoading = false.obs;

  void loginApi() async {
    // ========================================
    // 🚀 LOGIN API STARTED
    // ========================================

    // Validasi input
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      // ❌ Username atau password kosong
      Get.snackbar(
        "ERROR",
        "Username dan password tidak boleh kosong",
        snackPosition: SnackPosition.TOP,
        backgroundColor: const Color.fromARGB(63, 112, 111, 111),
        colorText: Colors.black,
      );
      return;
    }

    // ✅ Input valid, lanjut proses login
    isLoading.value = true;

    try {
      // 📤 Siapkan data request
      final requestData = {
        'username': usernameController.text,
        'password': passwordController.text,
      };

      // ⏳ Mengirim request ke server
      final response = await http.post(
        Uri.parse("${ClientNetwork.baseUrl}/latihan/login"),
        body: requestData,
      );

      // 📥 Response diterima
      if (response.statusCode == 200) {
        // ✅ Status 200 OK
        try {
          final Loginmodel loginModel = loginmodelFromJson(response.body);

          if (loginModel.status == true) {
            // ✅ Login berhasil
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString('token', loginModel.token);
            await prefs.setString('username', usernameController.text);

            // 💾 Token dan username tersimpan
            isLoading.value = false;

            // 🔄 Pindah ke halaman Home
            Get.offAllNamed(AppRoutes.homePage);

            Get.snackbar(
              "BERHASIL",
              loginModel.message,
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.green[100],
              colorText: Colors.black,
            );

            // ✅ LOGIN API COMPLETED SUCCESSFULLY
          } else {
            // ❌ Login gagal (status false)
            isLoading.value = false;
            Get.snackbar(
              "ERROR",
              loginModel.message,
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.red[100],
              colorText: Colors.black,
            );

            // ❌ LOGIN API FAILED
          }
        } catch (parseError) {
          // ❌ Error parsing JSON response
          isLoading.value = false;
          Get.snackbar(
            "ERROR",
            "Error parsing response",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red[100],
            colorText: Colors.black,
          );
          // ❌ LOGIN API FAILED - PARSE ERROR
        }
      } else {
        // ❌ Status code selain 200 (server error)
        isLoading.value = false;
        Get.snackbar(
          "ERROR",
          "Server error: ${response.statusCode}",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red[100],
          colorText: Colors.black,
        );
        // ❌ LOGIN API FAILED - SERVER ERROR
      }
    } catch (e) {
      // ❌ Terjadi exception saat login
      isLoading.value = false;
      Get.snackbar(
        "ERROR",
        "Terjadi kesalahan: ${e.toString()}",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red[100],
        colorText: Colors.black,
      );
      // ❌ LOGIN API FAILED - EXCEPTION
    }
  }

  void logout() async {
    // ========================================
    // 🚪 LOGOUT STARTED
    // ========================================

    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    usernameController.clear();
    passwordController.clear();

    Get.delete<LoginApiController>(force: true);
    Get.offAllNamed(AppRoutes.loginPage);

    Get.snackbar(
      "LOGOUT",
      "Berhasil keluar dari akun",
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.orange[100],
      colorText: Colors.black,
    );

    // ✅ LOGOUT COMPLETED
    // ========================================
  }
}