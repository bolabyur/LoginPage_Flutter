import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testflutter/controllers/example_controller.dart';
import 'package:testflutter/pages/mobile/example_mobile.dart';
import 'package:testflutter/pages/widescreen/example_widescreen.dart';

class ExampleScreen extends StatelessWidget {
  ExampleScreen({super.key});

  final controller = Get.find<ExampleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          //detection width screen?
          controller.updateLayout(constraints);
          return Obx(
            () => controller.isMobile.value
                ? ExampleMobile()
                : ExampleWidescreen(),
          );
        },
      ),
    );
  }
}
