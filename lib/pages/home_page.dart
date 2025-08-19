import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testflutter/pages/calculatorpage.dart';
import 'package:testflutter/pages/football_page.dart';
import 'package:testflutter/pages/profile_page.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  void changeTab(int index) {
    selectedIndex.value = index;
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomeController controller = Get.put(HomeController());

  final List<Widget> pages = [
    CalculatorPage(),
    FootballPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeTab,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: "Calculator",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer),
              label: "Football",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
