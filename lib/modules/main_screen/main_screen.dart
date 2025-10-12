import 'package:flutter/material.dart';

import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/modules/chat/chat_view.dart';
import 'package:mementum/modules/history/history_view.dart';
import 'package:mementum/modules/home/home_view.dart';
import 'package:mementum/modules/main_screen/main_screen_controller.dart';
import 'package:mementum/modules/memories/memories_view.dart';
import 'package:mementum/modules/profile/profile_view.dart';
import 'package:mementum/utils/app_colors.dart';

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
      //backgroundColor: Colors.transparent,
      body: Obx(() => screens[controller.currentIndex.value]),
      bottomNavigationBar: Obx(() {
        int currentIndex = controller.currentIndex.value;
        return BottomNavigationBar(
          onTap: controller.changeTab,
          currentIndex: currentIndex,
           unselectedItemColor: Color(0xff65676B),
          selectedItemColor: AppColors.primarycolor,
         
          unselectedLabelStyle: GoogleFonts.inter(
            //color: Color(0xff65676B),
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        //  backgroundColor: Color(0xffF9F7F1),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled, size: 30),
              label: 'Home',
              backgroundColor: Color(0xffF9F7F1),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined, size: 30),
              label: 'Maps',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline_outlined, size: 30),
              label: 'Memories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat, size: 30),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30),
              label: 'Profile',
            ),
          ],
        );
      }),
    );
  }
}
