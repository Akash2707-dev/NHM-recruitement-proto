import 'package:get/get.dart';
import 'package:grs/controllers/initial_screen_controller.dart';

class InitialScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InitialScreenController());
  }
}
