import 'package:flutter/material.dart';
import 'package:grs/controllers/step_one_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StepOne extends StatelessWidget {
  final StepOneController _controller = Get.put(StepOneController());
  TextEditingController _dateController = TextEditingController();
  String gender = ''; // Add this variable to hold the selected gender

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _controller.formKey,
        child: Column(
          children: <Widget>[
            Text("Your Applicant Number is :- NHM89760721"),
            TextFormField(
              decoration: InputDecoration(labelText: 'Full Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your full name';
                }
                return null;
              },
              onChanged: (value) => _controller.fullName.value = value,
            ),
            TextFormField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Date of Birth',
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                    }
                  },
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your date of birth';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Phone Number'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your phone number';
                }
                if (value.length != 10 || !RegExp(r'^[0-9]+$').hasMatch(value)) {
                  return 'Please enter a valid 10-digit phone number';
                }
                return null;
              },
              onChanged: (value) => _controller.phoneNumber.value = value,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Address'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your address';
                }
                return null;
              },
              onChanged: (value) => _controller.address.value = value,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Aadhar Number'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your Aadhar number';
                } else if (value.length != 12) {
                  return 'Aadhar number must be 12 digits';
                }
                return null;
              },
              onChanged: (value) => _controller.aadharNumber.value = value,
            ),
            Obx(() => Row(
                children: [
                  Text('Gender: '),
                  Radio(
                    value: 'Male',
                    groupValue: _controller.gender.value, // Update groupValue to hold selected gender
                    onChanged: (value) {
                      _controller.gender.value = value.toString(); // Update gender value in the controller
                    },
                  ),
                  Text('Male'),
                  Radio(
                    value: 'Female',
                    groupValue: _controller.gender.value, // Update groupValue to hold selected gender
                    onChanged: (value) {
                      _controller.gender.value = value.toString(); // Update gender value in the controller
                    },
                  ),
                  Text('Female'),
                  Radio(
                    value: 'Other',
                    groupValue: _controller.gender.value, // Update groupValue to hold selected gender
                    onChanged: (value) {
                      _controller.gender.value = value.toString(); // Update gender value in the controller
                    },
                  ),
                  Text('Other'),

                ],
              ),
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Caste'),
              items: [
                DropdownMenuItem(child: Text('Option 1'), value: 'Option 1'),
                DropdownMenuItem(child: Text('Option 2'), value: 'Option 2'),
                DropdownMenuItem(child: Text('Option 3'), value: 'Option 3'),
              ],
              onChanged: (value) {
                _controller.caste.value = value.toString();
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Have you taken NHM services before?'),
                  Obx(() => Row(
                      children: [
                        Radio(
                          value: 'Yes',
                          groupValue: _controller.nhmServices.value,
                          onChanged: (value) {
                            _controller.nhmServices.value = value.toString();
                          },
                        ),
                        Text('Yes'),
                        Radio(
                          value: 'No',
                          groupValue: _controller.nhmServices.value,
                          onChanged: (value) {
                            _controller.nhmServices.value = value.toString();
                          },
                        ),
                        Text('No'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Are you eligible for any reservation?'),
                Obx(() => Row(
                    children: [
                      Radio(
                        value: 'Yes',
                        groupValue: _controller.reservationEligibility.value,
                        onChanged: (value) {
                          _controller.reservationEligibility.value = value.toString();
                        },
                      ),
                      Text('Yes'),
                      Radio(
                        value: 'No',
                        groupValue: _controller.reservationEligibility.value,
                        onChanged: (value) {
                          _controller.reservationEligibility.value = value.toString();
                        },
                      ),
                      Text('No'),
                    ],
                  ),
                ),
              ],
            ),
            Obx(() => Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _controller.isButtonEnabled.value
                          ? () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Confirmation"),
                              content: Text("Are you sure you want to save the current details?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false); // Dismiss the dialog and return false
                                  },
                                  child: Text("No"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(true); // Dismiss the dialog and return true
                                  },
                                  child: Text("Yes"),
                                ),
                              ],
                            );
                          },
                        ).then((confirmed) {
                          if (confirmed) {
                            _controller.submitForm();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Row(
                                  children: [
                                    Icon(Icons.check_circle, color: Colors.green),
                                    SizedBox(width: 10),
                                    Text('Details have been saved'),
                                  ],
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        });
                      }
                          : null,
                      child: Text('Save'),
                    ),
                    SizedBox(width: 16), // Add space between the buttons
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Confirmation"),
                              content: Text("Are you sure you want to update the current details?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false); // Dismiss the dialog and return false
                                  },
                                  child: Text("No"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(true); // Dismiss the dialog and return true
                                  },
                                  child: Text("Yes"),
                                ),
                              ],
                            );
                          },
                        ).then((confirmed) {
                          if (confirmed) {
                            _controller.submitForm();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Row(
                                  children: [
                                    Icon(Icons.check_circle, color: Colors.green),
                                    SizedBox(width: 10),
                                    Text('Details have been updated'),
                                  ],
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        });
                      },
                      child: Text('Update'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}