import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GlobalService extends GetxController {
  @override
  void onInit() {
    readfromstorage();
    super.onInit();
  }

  var name = ''.obs;
  var bio = ''.obs;
  var profession = ''.obs;
  var nationality = ''.obs;
  var instagram = ''.obs;
  var linkedin = ''.obs;
  var profileimage = ''.obs;
  var coverimage = ''.obs;

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

  void readfromstorage() {
    final storage = GetStorage();
    name.value = storage.read('name');
    profession.value = storage.read('profession');
    bio.value = storage.read('bio');
    nationality.value = storage.read('nationality');
    linkedin.value = storage.read('linkedIn');
    instagram.value = storage.read('instagram');
    profileimage.value = storage.read('photoURL');
    coverimage.value = storage.read('coverPhotoURL');
  }

  void updatepforileurl(String url) {
    profileimage.value = url;
  }

  void updatecoverurl(String url) {
    coverimage.value = url;
  }
}
