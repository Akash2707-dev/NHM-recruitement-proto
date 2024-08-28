import 'package:get/get.dart';

class StepFourController extends GetxController {
  RxString selectedPost = RxString('MBBS (Intern)'); // Initialize with a default value
  List<String> posts = ['MBBS (Intern)', 'BAMS Doctor', 'Head Nurse'];

  void setSelectedPost(String post) {
    selectedPost.value = post;
  }
}
