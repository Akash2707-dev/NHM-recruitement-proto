import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grs/controllers/step_four_controller.dart';

class StepFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(StepFourController()); // Move this line outside the build method

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10),
          Text('Which Post would you like to apply for ?'),
          Center(
            child: GetBuilder<StepFourController>(
              builder: (controller) {
                return DropdownButton<String>(
                  value: controller.selectedPost.value, // Use the controller value
                  onChanged: (value) {
                    controller.setSelectedPost(value!); // Use the controller method
                  },
                  items: [
                    DropdownMenuItem(
                      value: 'MBBS (Intern)',
                      child: Text('MBBS (Intern)'),
                    ),
                    DropdownMenuItem(
                      value: 'BAMS Doctor',
                      child: Text('BAMS Doctor'),
                    ),
                    DropdownMenuItem(
                      value: 'Head Nurse',
                      child: Text('Head Nurse'),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Obx(() {
            final selectedPost = Get.find<StepFourController>().selectedPost.value;
            if (selectedPost.isNotEmpty) {
              return Text(
                'Selected Post: $selectedPost',
                style: TextStyle(fontWeight: FontWeight.bold),
              );
            } else {
              return SizedBox.shrink();
            }
          }),
        ],
      ),
    );
  }
}
