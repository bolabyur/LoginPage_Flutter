import 'package:get/get.dart';
import 'package:testflutter/controllers/notificationcontroller.dart';

class NotifBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(() => NotificationController());
  }
}