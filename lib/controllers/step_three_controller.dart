import 'package:get/get.dart';

class StepThreeController extends GetxController {
  RxList<Map<String, dynamic>> jobDetails = <Map<String, dynamic>>[].obs;

  void addJobDetail(String post, String organization, String location, String organizationType, String description, int salary) {
    jobDetails.add({
      'Post': post,
      'Organization': organization,
      'Location': location,
      'Organization Type': organizationType,
      'Description': description,
      'Salary': salary,
    });
  }

  void deleteJobDetail(int index) {
    jobDetails.removeAt(index);
  }
  void editJobDetail(int index, Map<String, dynamic> oldData, Map<String, dynamic> newData) {
    jobDetails[index] = newData;
  }

}
