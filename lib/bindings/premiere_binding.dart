import 'package:get/get.dart';
import 'package:testflutter/controllers/premiere_table_controller.dart';

class PremiereBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PremiereTableController());
  }
}