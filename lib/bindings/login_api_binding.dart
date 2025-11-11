import 'package:get/get.dart';
import 'package:testflutter/controllers/loginapicontroller.dart';

class LoginapiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginApiController>(() => LoginApiController());
  }
}