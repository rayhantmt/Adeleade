import 'package:get/get.dart';

class GlobalService extends GetxController {
  var name = ''.obs;
  var bio = ''.obs;
  var profession = ''.obs;
  var nationality = ''.obs;
  var instagram = ''.obs;
  var linkedin = ''.obs;
  void updaedinfo(
    String updatedname,
    String updtedbio,
    String updatedprofession,
    String upnationality,
    String updatedinstagram,
    String updatedlinkedin,
  ) {
    name.value = updatedname;
    bio.value = updtedbio;
    profession.value = updatedprofession;
    nationality.value = upnationality;
    instagram.value = updatedinstagram;
    linkedin.value = updatedlinkedin;
  }
}
