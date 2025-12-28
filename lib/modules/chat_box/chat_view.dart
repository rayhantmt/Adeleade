// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mementum/modules/chat_box/chat_controller.dart';
// import 'package:mementum/routes/app_pages.dart';
// import 'package:mementum/utils/app_images.dart';

// class ChatView extends GetView<ChatController> {
//   const ChatView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Image.asset(
//             AppImages.background,
//             height: double.infinity,
//             width: double.infinity,
//             fit: BoxFit.cover,
//           ),
//           Column(
//             children: [
//               SafeArea(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: SizedBox(
//                     height: Get.height * 0.07,
//                     child: Stack(
//                       children: [
                      
//                         Center(
//                           child: Text(
//                             'Chatbox',
//                             style: GoogleFonts.inter(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 18,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
          
//               Expanded(
//                 child: Container(
//                   color: Colors.white,
//                   height: double.infinity,
//                   child: ListView.builder(
//                     padding: EdgeInsets.only(top: 0,bottom: 0,left: 20,right: 20),
//                     itemCount: controller.conversations.length,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 10),
//                         child: GestureDetector(
//                           onTap: () => Get.toNamed(AppPages.chatdetails,arguments: {'image':controller.conversations[index].image,'name':controller.conversations[index].name}),
//                           child: Container(
//                             height: Get.height * 0.06,
//                             width: double.infinity,
//                             decoration: BoxDecoration(color: Colors.white),
//                             child: Row(
//                               children: [
//                                 ClipRRect(
//                                   borderRadius: BorderRadiusGeometry.circular(100),
//                                   child: Image.asset(controller.conversations[index].image),
//                                 ),
//                                 SizedBox(width: Get.width*0.01,),
//                                 Container(
//                                   width: Get.width*0.6,
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         controller.conversations[index].name,
//                                         style: GoogleFonts.inter(
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 14,
//                                           color: Colors.black,
//                                         ),
//                                       ),
//                                       Text(controller.conversations[index].msg,
//                                       overflow: TextOverflow.ellipsis,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                // Spacer(),
//                                 Expanded(
//                                   child: Text(controller.conversations[index].time,
//                                   textAlign: TextAlign.end,
//                                   maxLines: 1,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mementum/modules/chat_box/chat_controller.dart';
import 'package:mementum/utils/app_images.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.background,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: Get.height * 0.07,
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            'Chatbox',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Obx(() {
                    // Loading state
                    if (controller.isLoading.value && controller.chatRooms.isEmpty) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    // Empty state
                    if (controller.chatRooms.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.chat_bubble_outline,
                              size: 64,
                              color: Colors.grey[400],
                            ),
                            SizedBox(height: 16),
                            Text(
                              'No conversations yet',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    // Chat list
                    return RefreshIndicator(
                      onRefresh: controller.refreshChatRooms,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        itemCount: controller.chatRooms.length,
                        itemBuilder: (context, index) {
                          final chatRoom = controller.chatRooms[index];
                          final chatName = chatRoom.getChatName(controller.currentUserId.value);
                          final chatImage = chatRoom.getChatImage(controller.currentUserId.value);
                          final lastMsg = chatRoom.lastMessage?.content ?? 'No messages yet';
                          final time = chatRoom.getFormattedTime();
                          
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: GestureDetector(
                              onTap: () => controller.openChatDetails(chatRoom),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    // Profile Image with online indicator
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(50),
                                          child: CachedNetworkImage(
                                            imageUrl: chatImage,
                                            height: 55,
                                            width: 55,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) => Container(
                                              height: 55,
                                              width: 55,
                                              color: Colors.grey[300],
                                              child: Icon(
                                                Icons.person,
                                                color: Colors.grey[600],
                                                size: 30,
                                              ),
                                            ),
                                            errorWidget: (context, url, error) => Container(
                                              height: 55,
                                              width: 55,
                                              color: Colors.grey[300],
                                              child: Icon(
                                                Icons.person,
                                                color: Colors.grey[600],
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                        ),
                                        // Event badge indicator
                                        if (chatRoom.roomType == 'event')
                                          Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: Container(
                                              padding: EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                color: Colors.blue,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 2,
                                                ),
                                              ),
                                              child: Icon(
                                                Icons.event,
                                                size: 12,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    
                                    SizedBox(width: 12),
                                    
                                    // Chat info
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  chatName,
                                                  style: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                time,
                                                style: GoogleFonts.inter(
                                                  fontSize: 11,
                                                  color: Colors.grey[500],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  lastMsg,
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: GoogleFonts.inter(
                                                    fontSize: 13,
                                                    color: Colors.grey[600],
                                                    fontWeight: chatRoom.unreadCount > 0
                                                        ? FontWeight.w600
                                                        : FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              // Unread badge
                                              if (chatRoom.unreadCount > 0)
                                                Container(
                                                  margin: EdgeInsets.only(left: 8),
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 8,
                                                    vertical: 3,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius: BorderRadius.circular(12),
                                                  ),
                                                  child: Text(
                                                    '${chatRoom.unreadCount}',
                                                    style: GoogleFonts.inter(
                                                      color: Colors.white,
                                                      fontSize: 11,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}