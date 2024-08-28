import 'package:flutter/material.dart';
import 'package:flutter_stepper/flutter_stepper.dart';
import 'package:get/get.dart';
import 'package:grs/controllers/form_controller.dart';
import 'package:grs/forms/step_five.dart';
import 'package:grs/forms/step_four.dart';
import 'package:grs/forms/step_one.dart';
import 'package:grs/forms/step_three.dart';
import 'package:grs/forms/step_two.dart';
import 'package:grs/forms/step_six.dart';

class FormScreen extends StatelessWidget {
  final FormController formController = Get.put(FormController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recruitment Form'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => Stepper(
              type: StepperType.vertical,
              currentStep: formController.currentStep.value.clamp(0, 5), // Ensure currentStep is within 0-5
              onStepContinue: () {
                if (formController.currentStep.value < 5) {
                  formController.incrementStep();
                } else {
                  // Show dialog and handle actions
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Form Completed'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'The form has been completed.',
                            style: TextStyle(fontSize: 18), // Increased font size
                          ),
                          SizedBox(height: 16), // Added space
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Print logic
                                },
                                child: Text('Print'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Preview logic
                                },
                                child: Text('Preview'),
                              ),

                              ElevatedButton(
                                onPressed: () {
                                  // Submit logic
                                },
                                child: Text('Submit'),
                              ),
                            ],
                          ),
                        ],
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            formController.resetStep();
                            Navigator.of(context).pop(); // Close dialog
                          },
                          child: Text('Close'),
                        ),
                      ],
                    ),
                  );
                }
              },
              onStepCancel: () {
                formController.decrementStep();
              },
              onStepTapped: (step) {
                formController.goToStep(step);
              },
              steps: <Step>[
                // Your steps here
                Step(
                  title: Text('General Information'),
                  content: StepOne(),
                  isActive: formController.currentStep.value == 0,
                  state: formController.currentStep.value > 0 ? StepState.complete : StepState.editing,
                ),
                Step(
                  title: Text('Educational Details'),
                  content: StepTwo(),
                  isActive: formController.currentStep.value == 1,
                  state: formController.currentStep.value == 1 ? StepState.editing : formController.currentStep.value > 1 ? StepState.complete : StepState.disabled,
                ),
                Step(
                  title: Text('Experience'),
                  content: StepThree(),
                  isActive: formController.currentStep.value == 2,
                  state: formController.currentStep.value == 2 ? StepState.editing : formController.currentStep.value > 2 ? StepState.complete : StepState.disabled,
                ),
                Step(
                  title: Text('Post to Apply for'),
                  content: StepFour(),
                  isActive: formController.currentStep.value == 3,
                  state: formController.currentStep.value == 3 ? StepState.editing : formController.currentStep.value > 3 ? StepState.complete : StepState.disabled,
                ),
                Step(
                  title: Text('Upload Documents'),
                  content: StepFive(),
                  isActive: formController.currentStep.value == 4,
                  state: formController.currentStep.value == 4 ? StepState.editing : formController.currentStep.value > 4 ? StepState.complete : StepState.disabled,
                ),
                Step(
                  title: Text('Payment for Form'),
                  content: PaymentScreen(),
                  isActive: formController.currentStep.value == 5,
                  state: formController.currentStep.value == 5 ? StepState.editing : formController.currentStep.value > 5 ? StepState.complete : StepState.disabled,
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
