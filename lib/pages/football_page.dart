import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testflutter/controllers/football_controller.dart';
import 'package:testflutter/pages/mobile/football_mobile.dart';
import 'package:testflutter/pages/widescreen/football_widescreen.dart';

class FootballScreen extends StatelessWidget {
  FootballScreen({super.key});

  final controller = Get.find<FootballController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          //detection width screen?
          controller.updatelayouT(constraints);
          return Obx(
            () => controller.isMobile.value
                ? FootballMobile()
                : FootballWidescreen(),
          );
        },
      ),
    );
  }
}
