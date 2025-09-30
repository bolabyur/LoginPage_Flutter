import 'package:get/get.dart';
import 'package:testflutter/controllers/calculatorcontroller.dart';

class CalculatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalculatorController>(() => CalculatorController());
  }
}