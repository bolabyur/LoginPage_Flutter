import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testflutter/pages/calculatorpage.dart';
import 'package:testflutter/pages/contact_page.dart';
import 'package:testflutter/pages/mobile/football_mobile.dart';
import 'package:testflutter/pages/notification_page.dart';
import 'package:testflutter/pages/profile_page.dart';
import '../controllers/home_controller.dart'; // tambahkan ini

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.put(HomeController());

  final List<Widget> pages = [
    CalculatorPage(),
    FootballMobile(),
    NotificationPage(), // tambahkan halaman notification di sini
    ContactPage(),
    ProfilePage(),
  ];

  final List<String> titles = [
    "Calculator",
    "Football",
    "Notification",
    "Contact",
    "Profile",
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            titles[controller.selectedIndex.value],
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: IndexedStack(
          index: controller.selectedIndex.value,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: (index) => controller.changeIndex(index),
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: "Calculator",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer),
              label: "Football",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Notification",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_page),
              label: "Contact",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
