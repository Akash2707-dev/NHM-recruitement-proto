import 'package:get/get.dart';

class UploadController extends GetxController {
  var fileStatus = <String, bool>{}.obs;

  void setFileStatus(String fileName, bool isUploaded) {
    fileStatus[fileName] = isUploaded;
    update();
  }
}
