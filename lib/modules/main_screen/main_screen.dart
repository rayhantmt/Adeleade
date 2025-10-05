import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/state_manager.dart';
import 'package:mementum/modules/chat/chat_view.dart';
import 'package:mementum/modules/history/history_view.dart';
import 'package:mementum/modules/home/home_view.dart';
import 'package:mementum/modules/main_screen/main_screen_controller.dart';
import 'package:mementum/modules/memories/memories_view.dart';
import 'package:mementum/modules/profile/profile_view.dart';
import 'package:mementum/utils/app_colors.dart';
import 'package:mementum/utils/app_images.dart';

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeView(),
      ChatView(),
      MemoriesView(),
      HistoryView(),
      ProfileView(),
    ];
    return Scaffold(
      backgroundColor: Colors.red,
      body: Obx(() => screens[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () {
          int currentIndex = controller.currentIndex.value;
          return BottomNavigationBar(
            onTap: controller.changeTab,
            currentIndex: currentIndex,
            selectedItemColor: AppColors.primarycolor,
            unselectedItemColor: Color(0xff010101),
            backgroundColor: Colors.white,
           selectedLabelStyle: TextStyle(color: Colors.black), // label color when selected
            unselectedLabelStyle: TextStyle(color: Colors.black), // label color when unselected
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.homeicon,
                  color: currentIndex == 0 ? AppColors.primarycolor : Color(0xff010101),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.cahticon,
                  color: currentIndex == 1 ? AppColors.primarycolor : Color(0xff010101),
                ),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.memories,
                  color: currentIndex == 2 ? AppColors.primarycolor : Color(0xff010101),
                ),
                label: 'Memories',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.historyicon,
                  color: currentIndex == 3 ? AppColors.primarycolor : Color(0xff010101),
                ),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: currentIndex == 4 ? AppColors.primarycolor : Color(0xff010101),
                ),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}
