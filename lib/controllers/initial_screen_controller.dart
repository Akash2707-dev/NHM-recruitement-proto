import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grs/screens/form_screen.dart';

class InitialScreenController extends GetxController {
  final RxString phoneNumber = ''.obs;
  final RxBool isDialogVisible = false.obs;

  void showPhoneNumberDialog(BuildContext context) {
    isDialogVisible.value = true;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text('Enter Phone Number'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Please enter your 10 digit phone number before you begin'),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Obx(() => TextField(
                          onChanged: (value) {
                            phoneNumber.value = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            errorText: phoneNumber.value.isEmpty || phoneNumber.value.length != 10
                                ? 'Please enter a 10-digit number'
                                : null,
                            errorStyle: TextStyle(color: Colors.red),
                          ),
                          keyboardType: TextInputType.phone,
                        )),
                      ),
                      SizedBox(width: 16),
                      Obx(() => ElevatedButton(
                        onPressed: phoneNumber.value.length == 10
                            ? () {
                          // Add your logic here to use the phoneNumber
                          Get.to(FormScreen());
                        }
                            : null,
                        child: Text('Continue', style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(primary: phoneNumber.value.length == 10 ? Colors.green : Colors.grey),
                      )),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    ).then((value) {
      isDialogVisible.value = false;
    });
  }
}