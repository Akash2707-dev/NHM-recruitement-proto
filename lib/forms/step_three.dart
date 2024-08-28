import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grs/controllers/step_three_controller.dart';

class StepThree extends StatelessWidget {
  final TextEditingController postController = TextEditingController();
  final TextEditingController organizationController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final RxString organizationType = 'Government'.obs;

  @override
  Widget build(BuildContext context) {
    final StepThreeController stepThreeController = Get.put(StepThreeController());

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10),
          TextFormField(
            controller: postController,
            decoration: InputDecoration(labelText: 'Post'),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: organizationController,
            decoration: InputDecoration(labelText: 'Organization'),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: locationController,
            decoration: InputDecoration(labelText: 'Location'),
          ),
          SizedBox(height: 10),
          Text('Type of Organization'),
          RadioListTile(
            title: Text('Government'),
            value: 'Government',
            groupValue: organizationType.value,
            onChanged: (value) {
              organizationType.value = toString();
            },
          ),
          RadioListTile(
            title: Text('Autonomous'),
            value: 'Autonomous',
            groupValue: organizationType.value,
            onChanged: (value) {
              organizationType.value = toString();
            },
          ),
          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(labelText: 'Description'),
          ),
          TextFormField(
            controller: salaryController,
            decoration: InputDecoration(labelText: 'Salary (INR)'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Confirm Addition'),
                    content: Text('Are you sure you want to add these job details?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false); // Return false to indicate cancellation
                        },
                        child: Text('No'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true); // Return true to indicate confirmation
                        },
                        child: Text('Yes'),
                      ),
                    ],
                  );
                },
              ).then((confirmed) {
                if (confirmed ?? false) {
                  if (postController.text.isNotEmpty &&
                      organizationController.text.isNotEmpty &&
                      locationController.text.isNotEmpty &&
                      descriptionController.text.isNotEmpty &&
                      salaryController.text.isNotEmpty) {
                    stepThreeController.addJobDetail(
                      postController.text,
                      organizationController.text,
                      locationController.text,
                      organizationType.value,
                      descriptionController.text,
                      int.parse(salaryController.text),
                    );
                    postController.clear();
                    organizationController.clear();
                    locationController.clear();
                    descriptionController.clear();
                    salaryController.clear();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Please fill in all fields'),
                      ),
                    );
                  }
                }
              });
            },
            child: Text('Add'),
          ),

          SizedBox(height: 20),
          Obx(() => ListView.builder(
            shrinkWrap: true,
            itemCount: stepThreeController.jobDetails.length,
            itemBuilder: (context, index) {
              final job = stepThreeController.jobDetails[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Job ${index + 1}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Post: ${job['Post']}'),
                  Text('Organization: ${job['Organization']}'),
                  Text('Location: ${job['Location']}'),
                  Text('Type of Organization: ${job['Organization Type']}'),
                  Text('Description: ${job['Description']}'),
                  Text('Salary: ${job['Salary']} INR'),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Confirm Deletion'),
                                content: Text('Are you sure you want to delete this job detail?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(false); // Return false to indicate cancellation
                                    },
                                    child: Text('No'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(true); // Return true to indicate confirmation
                                    },
                                    child: Text('Yes'),
                                  ),
                                ],
                              );
                            },
                          ).then((confirmed) {
                            if (confirmed ?? false) {
                              stepThreeController.deleteJobDetail(index);
                              Get.snackbar(
                                'Deleted',
                                'Job detail deleted',
                                backgroundColor: Colors.green,
                                snackPosition: SnackPosition.BOTTOM, // Show the toast at the bottom
                              );
                            }
                          });
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
                              String editedPost = job['Post'];
                              String editedOrganization = job['Organization'];
                              String editedLocation = job['Location'];
                              String editedOrganizationType = job['Organization Type'];
                              String editedDescription = job['Description'];
                              int editedSalary = job['Salary'];

                              return AlertDialog(
                                title: Text('Edit Job Detail'),
                                content: SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        initialValue: editedPost,
                                        onChanged: (value) => editedPost = value,
                                        decoration: InputDecoration(labelText: 'Post'),
                                      ),
                                      TextFormField(
                                        initialValue: editedOrganization,
                                        onChanged: (value) => editedOrganization = value,
                                        decoration: InputDecoration(labelText: 'Organization'),
                                      ),
                                      TextFormField(
                                        initialValue: editedLocation,
                                        onChanged: (value) => editedLocation = value,
                                        decoration: InputDecoration(labelText: 'Location'),
                                      ),
                                      Text('Type of Organization'),
                                      RadioListTile(
                                        title: Text('Government'),
                                        value: 'Government',
                                        groupValue: editedOrganizationType ?? '',
                                        onChanged: (value) {
                                          editedOrganizationType = value ?? '';
                                        },
                                      ),
                                      RadioListTile(
                                        title: Text('Autonomous'),
                                        value: 'Autonomous',
                                        groupValue: editedOrganizationType ?? '',
                                        onChanged: (value) {
                                          editedOrganizationType = value ?? '';
                                        },
                                      ),
                                      TextFormField(
                                        initialValue: editedDescription,
                                        onChanged: (value) => editedDescription = value,
                                        decoration: InputDecoration(labelText: 'Description'),
                                      ),
                                      TextFormField(
                                        initialValue: editedSalary.toString(),
                                        onChanged: (value) => editedSalary = int.tryParse(value) ?? 0,
                                        decoration: InputDecoration(labelText: 'Salary (INR)'),
                                        keyboardType: TextInputType.number,
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
                                      stepThreeController.editJobDetail(
                                        index,
                                        {
                                          'Post': job['Post'],
                                          'Organization': job['Organization'],
                                          'Location': job['Location'],
                                          'Organization Type': job['Organization Type'],
                                          'Description': job['Description'],
                                          'Salary': job['Salary'],
                                        },
                                        {
                                          'Post': editedPost,
                                          'Organization': editedOrganization,
                                          'Location': editedLocation,
                                          'Organization Type': editedOrganizationType,
                                          'Description': editedDescription,
                                          'Salary': editedSalary,
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


                ],
              );
            },
          )),
        ],
      ),
    );
  }
}
