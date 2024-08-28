import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grs/controllers/step_two_controller.dart';

class StepTwo extends StatelessWidget {
  final TextEditingController degreeController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController instituteController = TextEditingController();
  final TextEditingController percentileController = TextEditingController();
  final TextEditingController passingYearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final EducationController educationController = Get.put(EducationController());

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10),
          TextFormField(
            controller: degreeController,
            decoration: InputDecoration(labelText: 'Education Degree'),
          ),
          TextFormField(
            controller: placeController,
            decoration: InputDecoration(labelText: 'Place'),
          ),
          TextFormField(
            controller: instituteController,
            decoration: InputDecoration(labelText: 'Institute'),
          ),
          TextFormField(
            controller: percentileController,
            decoration: InputDecoration(labelText: 'Percentile'),
          ),
          TextFormField(
            controller: passingYearController,
            decoration: InputDecoration(labelText: 'Passing Year'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              if (degreeController.text.isNotEmpty &&
                  placeController.text.isNotEmpty &&
                  instituteController.text.isNotEmpty &&
                  percentileController.text.isNotEmpty &&
                  passingYearController.text.isNotEmpty) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirmation'),
                      content: Text('Are you sure you want to add these details?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('No'),
                        ),
                        TextButton(
                          onPressed: () {
                            educationController.addEducationDetail(
                              degreeController.text,
                              placeController.text,
                              instituteController.text,
                              percentileController.text,
                              passingYearController.text,
                            );
                            degreeController.clear();
                            placeController.clear();
                            instituteController.clear();
                            percentileController.clear();
                            passingYearController.clear();
                            Navigator.of(context).pop();
                          },
                          child: Text('Yes'),
                        ),
                      ],
                    );
                  },
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    content: Text('Please fill in all fields'),
                  ),
                );
              }
            },
            child: Text('Add'),
          ),

          SizedBox(height: 20),
          Obx(() => ListView.builder(
            shrinkWrap: true,
            itemCount: educationController.educationDetails.length,
            itemBuilder: (context, index) {
              final education = educationController.educationDetails[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Degree ${index + 1}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Education Degree: ${education['Education Degree']}'),
                  Text('Place: ${education['Place']}'),
                  Text('Institute: ${education['Institute']}'),
                  Text('Percentile: ${education['Percentile']}'),
                  Text('Passing Year: ${education['Passing Year']}'),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          educationController.deleteEducationDetail(index);
                        },
                        child: Text('Delete'),
                      ),
                      SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              // Define temporary variables to store the edited values
                              String editedDegree = education['Education Degree'] ?? '';
                              String editedPlace = education['Place'] ?? '';
                              String editedInstitute = education['Institute'] ?? '';
                              String editedPercentile = education['Percentile'] ?? '';
                              String editedPassingYear = education['Passing Year'] ?? '';

                              return AlertDialog(
                                title: Text('Edit Education Detail'),
                                content: SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        controller: TextEditingController(text: editedDegree),
                                        onChanged: (value) => editedDegree = value,
                                        decoration: InputDecoration(labelText: 'Education Degree'),
                                      ),
                                      TextFormField(
                                        controller: TextEditingController(text: editedPlace),
                                        onChanged: (value) => editedPlace = value,
                                        decoration: InputDecoration(labelText: 'Place'),
                                      ),
                                      TextFormField(
                                        controller: TextEditingController(text: editedInstitute),
                                        onChanged: (value) => editedInstitute = value,
                                        decoration: InputDecoration(labelText: 'Institute'),
                                      ),
                                      TextFormField(
                                        controller: TextEditingController(text: editedPercentile),
                                        onChanged: (value) => editedPercentile = value,
                                        decoration: InputDecoration(labelText: 'Percentile'),
                                      ),
                                      TextFormField(
                                        controller: TextEditingController(text: editedPassingYear),
                                        onChanged: (value) => editedPassingYear = value,
                                        decoration: InputDecoration(labelText: 'Passing Year'),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      educationController.editEducationDetail(
                                        index,
                                        {
                                          'Education Degree': education['Education Degree'] ?? '',
                                          'Place': education['Place'] ?? '',
                                          'Institute': education['Institute'] ?? '',
                                          'Percentile': education['Percentile'] ?? '',
                                          'Passing Year': education['Passing Year'] ?? '',
                                        },
                                        {
                                          'Education Degree': editedDegree,
                                          'Place': editedPlace,
                                          'Institute': editedInstitute,
                                          'Percentile': editedPercentile,
                                          'Passing Year': editedPassingYear,
                                        },
                                      );
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Save'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text('Edit'),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              );
            },
          )),
        ],
      ),
    );
  }
}