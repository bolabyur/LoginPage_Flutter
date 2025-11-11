import 'package:get/get.dart';
import 'package:testflutter/bindings/calculator_binding.dart';
import 'package:testflutter/bindings/contact_binding.dart';
import 'package:testflutter/bindings/example_binding.dart';
import 'package:testflutter/bindings/football_edit_binding.dart';
import 'package:testflutter/bindings/football_player_binding.dart';
import 'package:testflutter/bindings/login_api_binding.dart';
import 'package:testflutter/bindings/login_binding.dart';
import 'package:testflutter/bindings/notificationbinding.dart';
import 'package:testflutter/bindings/premiere_binding.dart';
import 'package:testflutter/bindings/splashscreen_binding.dart';
import 'package:testflutter/pages/calculatorpage.dart';
import 'package:testflutter/pages/contact_page.dart';
import 'package:testflutter/pages/example_page.dart';
import 'package:testflutter/pages/football_edit_page.dart';
import 'package:testflutter/pages/football_page.dart';
import 'package:testflutter/pages/home_page.dart';
import 'package:testflutter/pages/loginapi.dart';
import 'package:testflutter/pages/notification_page.dart';
import 'package:testflutter/pages/premier_table_page.dart';
import 'package:testflutter/pages/profile_page.dart';
import 'package:testflutter/pages/registerpage.dart';
import 'package:testflutter/pages/splashscreen_page.dart';
import 'package:testflutter/routes/routes.dart'; // <<< penting ini

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.loginPage, page: () => LoginApiPage(), binding: LoginapiBinding()),
    GetPage(name: AppRoutes.registerPage, page: () => RegisterPage()),
    GetPage(name: AppRoutes.calculator, page: () => CalculatorPage()),
    GetPage(name: AppRoutes.footballscreen, page: () => FootballScreen() , binding: FootballPlayerBinding()),
    GetPage(name: AppRoutes.footballEditPage, page: () => FootballEditPage(), binding: FootballEditBinding()),
    GetPage(name: AppRoutes.homePage, page: () => HomePage(), bindings: [
      LoginBinding(),
      LoginapiBinding(),
      ContactBinding(),
      FootballPlayerBinding(),
      FootballEditBinding(),
      CalculatorBinding(),  
      NotifBinding()  
    ]),
    GetPage(name: AppRoutes.splashScreenPage, page: () => SplashScreenPage(), binding: SplashScreenBinding()),
    GetPage(name: AppRoutes.profilePage, page: () => ProfilePage(), binding: FootballPlayerBinding()),
    GetPage(name: AppRoutes.examplescreen, page: () => ExampleScreen(), bindings: [   ExampleBinding(), ]),
    GetPage(name: AppRoutes.contactpage, page: () => ContactPage(), bindings: [ ContactBinding(), ]),
    GetPage(name: AppRoutes.notification, page: () => NotificationPage(), bindings: [ NotifBinding(), ]),
    GetPage(name: AppRoutes.premieretable, page: () => PremiereTablePage(), bindings: [ PremiereBinding(), ]),
  ];
}
