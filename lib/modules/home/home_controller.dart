import 'package:get/get.dart';
import 'package:mementum/modules/home/home_model.dart';
import 'package:mementum/utils/app_images.dart';

class HomeController extends GetxController{
  var events=[
Event(tittle: "Gril's Night out", date_time: "20 Sept 2025, 5:00 PM", location: "Dhaka,Bangladesh", maxpeople: '15', joinedpeople: '7',image: AppImages.event1,maxmember: '30',members: '5'),
Event(tittle: "Tenis", date_time: "20 Sept 2025, 5:00 PM", location: "Dhaka,Bangladesh", maxpeople: '15', joinedpeople: '7',image: AppImages.event2,maxmember: '30',members: '5'),
Event(tittle: "Hiking Adventure", date_time: "20 Sept 2025, 5:00 PM", location: "Dhaka,Bangladesh", maxpeople: '15', joinedpeople: '7',image: AppImages.event3,maxmember: '30',members: '5'),
Event(tittle: "Gala night", date_time: "20 Sept 2025, 5:00 PM", location: "Dhaka,Bangladesh", maxpeople: '15', joinedpeople: '7',image: AppImages.event4,maxmember: '30',members: '5'),
Event(tittle: "Gril's Night out", date_time: "20 Sept 2025, 5:00 PM", location: "Dhaka,Bangladesh", maxpeople: '15', joinedpeople: '7',image: AppImages.event5,maxmember: '30',members: '5'),
Event(tittle: "Gril's Night out", date_time: "20 Sept 2025, 5:00 PM", location: "Dhaka,Bangladesh", maxpeople: '15', joinedpeople: '7',image: AppImages.event6,maxmember: '30',members: '5'),
Event(tittle: "Gril's Night out", date_time: "20 Sept 2025, 5:00 PM", location: "Dhaka,Bangladesh", maxpeople: '15', joinedpeople: '7',image: AppImages.event6,maxmember: '30',members: '5'),

Event(tittle: "Gril's Night out", date_time: "20 Sept 2025, 5:00 PM", location: "Dhaka,Bangladesh", maxpeople: '15', joinedpeople: '7',image: AppImages.event6,maxmember: '30',members: '5'),

Event(tittle: "Gril's Night out", date_time: "20 Sept 2025, 5:00 PM", location: "Dhaka,Bangladesh", maxpeople: '15', joinedpeople: '7',image: AppImages.event6,maxmember: '30',members: '5'),
Event(tittle: "Gril's Night out", date_time: "20 Sept 2025, 5:00 PM", location: "Dhaka,Bangladesh", maxpeople: '15', joinedpeople: '7',image: AppImages.event6,maxmember: '30',members: '5'),

Event(tittle: "Gril's Night out", date_time: "20 Sept 2025, 5:00 PM", location: "Dhaka,Bangladesh", maxpeople: '15', joinedpeople: '7',image: AppImages.event6,maxmember: '30',members: '5'),

Event(tittle: "Gril's Night out", date_time: "20 Sept 2025, 5:00 PM", location: "Dhaka,Bangladesh", maxpeople: '15', joinedpeople: '7',image: AppImages.event6,maxmember: '30',members: '5'),
Event(tittle: "Gril's Night out", date_time: "20 Sept 2025, 5:00 PM", location: "Dhaka,Bangladesh", maxpeople: '15', joinedpeople: '7',image: AppImages.event6,maxmember: '30',members: '5'),
Event(tittle: "Gril's Night out", date_time: "20 Sept 2025, 5:00 PM", location: "Dhaka,Bangladesh", maxpeople: '15', joinedpeople: '7',image: AppImages.event6,maxmember: '30',members: '5'),
Event(tittle: "Gril's Night out", date_time: "20 Sept 2025, 5:00 PM", location: "Dhaka,Bangladesh", maxpeople: '15', joinedpeople: '7',image: AppImages.event6,maxmember: '30',members: '5'),


  ].obs;

  var ctgry=[
Category(categories: 'All',),
Category(categories: 'Teavelling'),
Category(categories: 'Music'),
Category(categories: 'Mountain'),
Category(categories: 'Sea'),
Category(categories: 'Lake'),
Category(categories: 'Spritual')
  ].obs;
  // Add this variable
var selectedCategoryIndex = 0.obs;

// Add this function
void selectCategory(int index) {
  selectedCategoryIndex.value = index;
}
}