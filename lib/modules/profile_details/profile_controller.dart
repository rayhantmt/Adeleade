import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mementum/modules/profile_details/profile_model.dart';
import 'package:mementum/utils/app_images.dart';

class ProfileController extends GetxController{
  var gallery=[
    ProfileModel(image: AppImages.event1,),
     ProfileModel(image: AppImages.event2,),
      ProfileModel(image: AppImages.event3,),
  ];
  late  String id;
  

  @override
  void onInit() {
   var arg=Get.arguments;
  
  id=arg['id'];
  print(id);
  final storage=GetStorage();

  var  uid= storage.read('id');
  print('Userid $uid');
    super.onInit();
  }
  

}