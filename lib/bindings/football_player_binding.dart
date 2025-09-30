import 'package:get/get.dart';
import 'package:testflutter/controllers/football_controller.dart';

class FootballPlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FootballController>(() => FootballController());
  }
}