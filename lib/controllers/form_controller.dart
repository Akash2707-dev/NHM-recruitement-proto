import 'package:get/get.dart';

class FormController extends GetxController {
  RxInt currentStep = 0.obs;
  RxBool complete = false.obs;

  void incrementStep() {
    if (currentStep.value < 7) {
      currentStep.value += 1;
    } else {
      complete.value = true;
    }
  }

  void decrementStep() {
    if (currentStep.value > 0) {
      currentStep.value -= 1;
    } else {
      currentStep.value = 0;
    }
  }

  void goToStep(int step) {
    currentStep.value = step;
  }
  void resetStep() {
    currentStep.value = 0;
  }
}
