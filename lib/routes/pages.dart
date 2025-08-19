import 'package:get/get.dart';
import 'package:testflutter/pages/add_player_page.dart';
import 'package:testflutter/pages/calculatorpage.dart';
import 'package:testflutter/pages/football_page.dart';
import 'package:testflutter/pages/football_edit_page.dart';
import 'package:testflutter/pages/home_page.dart';
import 'package:testflutter/pages/loginpage.dart';
import 'package:testflutter/pages/registerpage.dart';
import 'package:testflutter/routes/routes.dart'; // <<< penting ini

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.loginPage, page: () => LoginPage()),
    GetPage(name: AppRoutes.registerPage, page: () => RegisterPage()),
    GetPage(name: AppRoutes.calculator, page: () => CalculatorPage()),
    GetPage(name: AppRoutes.footballPlayers, page: () => FootballPage()),
    GetPage(name: AppRoutes.footballEditPage, page: () => EditPlayerPage()),
    GetPage(name: AppRoutes.addPlayerPage, page: () => AddPlayerPage()),
    GetPage(name: AppRoutes.homePage, page: () => HomePage()),
  ];
}
