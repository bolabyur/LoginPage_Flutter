import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testflutter/routes/routes.dart';

class SplashscreenController extends GetxController{
@override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  checkLogin()async{
    await Future.delayed(const Duration(seconds: 4));
    final prefs = await SharedPreferences.getInstance();
    final savedUsername = prefs.getString('username') ?? '';
    if (savedUsername.isNotEmpty) {
      Get.offAllNamed(AppRoutes.homePage);
    } else {
      Get.offAllNamed(AppRoutes.loginPage);
    }
  }
}