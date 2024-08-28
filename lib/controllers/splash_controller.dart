import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Add your logic here, such as loading data or animations
    Future.delayed(Duration(seconds: 3), () {
      // Navigate to the initial page after 2 seconds
      Get.offAllNamed("/grs/screens/initial_screen"); // Replace '/initial' with your initial page route
    });
  }
}
