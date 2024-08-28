import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepOneController extends GetxController {
  final RxString applicantNumber = ''.obs;
  final RxString fullName = ''.obs;
  final RxString dob = ''.obs;
  final RxString phoneNumber = ''.obs;
  final RxString address = ''.obs;
  final RxString aadharNumber = ''.obs;
  final RxString gender = ''.obs;
  final RxString caste = ''.obs;
  final RxString nhmServices = ''.obs;
  final RxString reservationEligibility = ''.obs;
  final RxBool isFormSubmitted = false.obs;
  final isButtonEnabled = true.obs;
  final formKey = GlobalKey<FormState>();


  void submitForm() {
    if (formKey.currentState!.validate()) {
      // All fields are valid, proceed to the next step
    }
  }
  void disableButton() {
    isButtonEnabled.value = false;
  }
}




