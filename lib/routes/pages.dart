import 'package:get/get.dart';
import 'package:testflutter/bindings/calculator_binding.dart';
import 'package:testflutter/bindings/contact_binding.dart';
import 'package:testflutter/bindings/football_edit_binding.dart';
import 'package:testflutter/bindings/football_player_binding.dart';
import 'package:testflutter/bindings/login_binding.dart';
import 'package:testflutter/bindings/splashscreen_binding.dart';
import 'package:testflutter/pages/calculatorpage.dart';
import 'package:testflutter/pages/contact_page.dart';
import 'package:testflutter/pages/football_edit_page.dart';
import 'package:testflutter/pages/football_page.dart';
import 'package:testflutter/pages/home_page.dart';
import 'package:testflutter/pages/loginpage.dart';
import 'package:testflutter/pages/profile_page.dart';
import 'package:testflutter/pages/registerpage.dart';
import 'package:testflutter/pages/splashscreen_page.dart';
import 'package:testflutter/routes/routes.dart'; // <<< penting ini

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.loginPage, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: AppRoutes.registerPage, page: () => RegisterPage()),
    GetPage(name: AppRoutes.calculator, page: () => CalculatorPage()),
    GetPage(name: AppRoutes.footballPlayers, page: () => FootballPage()),
    GetPage(name: AppRoutes.footballEditPage, page: () => FootballEditPage()),
    GetPage(name: AppRoutes.homePage, page: () => HomePage(), bindings: [
      LoginBinding(),
      ContactBinding(),
      FootballPlayerBinding(),
      FootballEditBinding(),
      CalculatorBinding(),   
    ]),
    GetPage(name: AppRoutes.splashScreenPage, page: () => SplashScreenPage(), binding: SplashScreenBinding()),
    GetPage(name: AppRoutes.profilePage, page: () => ProfilePage()),
    GetPage(name: AppRoutes.contactPage, page: () => ContactPage(), binding: ContactBinding()),
  ];
}
