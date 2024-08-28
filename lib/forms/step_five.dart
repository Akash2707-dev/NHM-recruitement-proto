import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grs/controllers/step_five_controller.dart';

class StepFive extends StatelessWidget {
  final UploadController uploadController = Get.put(UploadController());

  final List<String> documents = [
    'Passport Size Photo',
    'Digital Signature',
    'Photo ID (Aadhar/Pan)',
    'School Leaving Certificate',
    'Caste Certificate',
    'Non-creamy Layer Certificate (if any)',
    'Domicile Certificate (if any)',
    '10th Marksheet',
    '12th Marksheet',
    'Graduation Degree Certificate'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(() => DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Name of Document',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'Status',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'Actions',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
        rows: documents.map((document) {
          bool isUploaded = uploadController.fileStatus[document] ?? false;
          return DataRow(
            cells: <DataCell>[
              DataCell(Text(document)),
              DataCell(Text(isUploaded ? 'Completed' : 'Incomplete', style: TextStyle(color: isUploaded ? Colors.green : Colors.red))),
              DataCell(
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Update the status to 'Completed' when the button is pressed
                        uploadController.setFileStatus(document, true);
                      },
                      child: Text('Upload'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(isUploaded ? Colors.green : Colors.blue),
                      ),
                    ),
                    SizedBox(width: 8), // Add some space between the buttons
                    ElevatedButton(
                      onPressed: () {
                        // Reset the status back to 'Incomplete' when the button is pressed
                        uploadController.setFileStatus(document, false);
                      },
                      child: Icon(Icons.close, color: Colors.red), // Display a red X icon
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }).toList(),
      )),
    );
  }
}
