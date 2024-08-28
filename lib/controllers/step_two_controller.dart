import 'package:get/get.dart';

class EducationController extends GetxController {
  RxList<Map<String, String>> educationDetails = <Map<String, String>>[].obs;

  void addEducationDetail(String degree, String place, String institute, String percentile, String passingYear) {
    educationDetails.add({
      'Education Degree': degree,
      'Place': place,
      'Institute': institute,
      'Percentile': percentile,
      'Passing Year': passingYear,
    });
  }

  void deleteEducationDetail(int index) {
    educationDetails.removeAt(index);
  }
  void editEducationDetail(int index, Map<String, String> oldData, Map<String, String> newData) {
    educationDetails[index] = {
      'Education Degree': newData['Education Degree'] ?? oldData['Education Degree'] ?? '',
      'Place': newData['Place'] ?? oldData['Place'] ?? '',
      'Institute': newData['Institute'] ?? oldData['Institute'] ?? '',
      'Percentile': newData['Percentile'] ?? oldData['Percentile'] ?? '',
      'Passing Year': newData['Passing Year'] ?? oldData['Passing Year'] ?? '',
    };
    educationDetails.refresh(); // This line refreshes the observable list
  }
}
