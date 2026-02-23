// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:mementum/modules/chat_details/chat_details_controller.dart';
// import 'package:mementum/utils/app_images.dart';

// class ChatDetailsView extends GetView<ChatDetailsController> {
//   const ChatDetailsView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(999),
//               child: Image.network(
//                 controller.img,
//                 height: Get.height * 0.1,
//                 width: Get.width * 0.1,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             SizedBox(width: Get.width * 0.04),
//             Text(controller.name.toUpperCase()),
//           ],
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           // Messages List
//           Expanded(
//             child: Obx(() {
//               if (controller.isLoading.value && controller.msgs.isEmpty) {
//                 return Center(child: CircularProgressIndicator());
//               }

//               if (controller.msgs.isEmpty) {
//                 return Center(
//                   child: Text(
//                     'No messages yet',
//                     style: GoogleFonts.inter(fontSize: 16, color: Colors.grey),
//                   ),
//                 );
//               }

//               return ListView.builder(
//                 controller: controller.scrollController,
//                 reverse: true,
//                 itemCount: controller.msgs.length,
//                 itemBuilder: (context, index) {
//                   final message = controller.msgs[index];

//                   return Padding(
//                     padding: const EdgeInsets.only(left: 20, right: 20),
//                     child: Column(
//                       crossAxisAlignment: message.isme == false
//                           ? CrossAxisAlignment.start
//                           : CrossAxisAlignment.end,
//                       children: [
//                         Text(
//                           message.name,
//                           style: GoogleFonts.inter(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 14,
//                             color: Color(0xff000E08),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 10, bottom: 10),
//                           child: _buildMessageContent(message),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             }),
//           ),

//           // Input Area
//           Container(
//             height: Get.height * 0.1,
//             width: double.infinity,
//             decoration: BoxDecoration(color: Colors.white),
//             child: Padding(
//               padding: const EdgeInsets.only(left: 20, right: 20),
//               child: Row(
//                 children: [
//                   // Attach File Button
//                   GestureDetector(
//                     onTap: controller.showImageSourceOptions,
//                     child: Image.asset(
//                       AppImages.attachfile_logo,
//                       height: Get.height * 0.05,
//                       width: Get.width * 0.1,
//                     ),
//                   ),

//                   // Text Input
//                   Container(
//                     height: Get.height * 0.1,
//                     width: Get.width * 0.6,
//                     child: TextFormField(
//                       controller: controller.messageController,
//                       onChanged: controller.handleInputChange,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: 'Write your message',
//                         suffixIcon: Image.asset(
//                           AppImages.message_input_logo,
//                           height: Get.height * 0.03,
//                           width: Get.width * 0.1,
//                         ),
//                       ),
//                     ),
//                   ),

//                   // Camera Button
//                   GestureDetector(
//                     onTap: () => controller.pickAndSendImage(ImageSource.camera),
//                     child: Image.asset(
//                       AppImages.cameralogo,
//                       height: Get.height * 0.05,
//                       width: Get.width * 0.08,
//                     ),
//                   ),

//                   // Microphone Button (Press and Hold)
//                   Obx(() => GestureDetector(
//                     onLongPressStart: (_) => controller.startRecording(),
//                     onLongPressEnd: (_) => controller.stopRecordingAndSend(),
//                     onTap: controller.isRecording.value
//                         ? controller.cancelRecording
//                         : controller.sendMessage,
//                     child: controller.isSending.value
//                         ? SizedBox(
//                             height: Get.height * 0.035,
//                             width: Get.width * 0.1,
//                             child: CircularProgressIndicator(strokeWidth: 2),
//                           )
//                         : Image.asset(
//                             controller.isRecording.value
//                                 ? AppImages.microphone_logo  // Show recording state
//                                 : AppImages.microphone_logo,
//                             height: Get.height * 0.035,
//                             width: Get.width * 0.1,
//                             color: controller.isRecording.value ? Colors.red : null,
//                           ),
//                   )),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Build message content based on type
//   Widget _buildMessageContent(message) {
//     switch (message.messageType) {
//       case 'image':
//         return message.mediaURL != null
//             ? CachedNetworkImage(
//                 imageUrl: message.mediaURL!,
//                 width: Get.width * 0.6,
//                 placeholder: (context, url) => CircularProgressIndicator(),
//                 errorWidget: (context, url, error) => Icon(Icons.error),
//               )
//             : Text(message.msg, style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 12));

//       case 'audio':
//         return message.mediaURL != null
//             ? _AudioPlayer(audioUrl: message.mediaURL!)
//             : Text(message.msg, style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 12));

//       default:
//         return Text(
//           message.msg,
//           style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 12),
//         );
//     }
//   }
// }

// // Simple Audio Player Widget
// class _AudioPlayer extends StatefulWidget {
//   final String audioUrl;

//   const _AudioPlayer({required this.audioUrl});

//   @override
//   State<_AudioPlayer> createState() => _AudioPlayerState();
// }

// class _AudioPlayerState extends State<_AudioPlayer> {
//   final AudioPlayer _player = AudioPlayer();
//   bool isPlaying = false;

//   @override
//   void dispose() {
//     _player.dispose();
//     super.dispose();
//   }

//   void _playPause() async {
//     if (isPlaying) {
//       await _player.pause();
//       setState(() => isPlaying = false);
//     } else {
//       await _player.play(UrlSource(widget.audioUrl));
//       setState(() => isPlaying = true);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         IconButton(
//           icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
//           onPressed: _playPause,
//         ),
//         Text('Audio Message', style: GoogleFonts.inter(fontSize: 12)),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:mementum/modules/chat_details/chat_details_controller.dart';
import 'package:mementum/utils/app_images.dart';
import 'package:mementum/utils/app_colors.dart';
import 'package:image_picker/image_picker.dart';

class ChatDetailsView extends GetView<ChatDetailsController> {
  const ChatDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    print('This is event id ${controller.eventId}');
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () => controller.fetchEventAndNavigate(controller.eventId),
          child: Row(
            children: [
              SizedBox(
                height: Get.width * 0.1,
                width: Get.width * 0.1,
                child: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  backgroundImage: controller.img.isNotEmpty
                      ? NetworkImage(controller.img)
                      : null,
                  onBackgroundImageError: (_, __) {},
                  child: controller.img.isEmpty
                      ? const Icon(Icons.person, color: Colors.grey)
                      : null,
                ),
              ),
          
              SizedBox(width: Get.width * 0.04),
              Text(controller.name.toUpperCase()),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Messages List
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value && controller.msgs.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }

              if (controller.msgs.isEmpty) {
                return Center(
                  child: Text(
                    'No messages yet',
                    style: GoogleFonts.inter(fontSize: 16, color: Colors.grey),
                  ),
                );
              }

              return ListView.builder(
                controller: controller.scrollController,
                reverse: true,
                itemCount: controller.msgs.length,
                itemBuilder: (context, index) {
                  final message = controller.msgs[index];

                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: message.isme == false
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.end,
                      children: [
                        Text(
                          message.name,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: _buildMessageContent(message),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),

          // Input Area
          Container(
            height: Get.height * 0.1,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Attach File Button
                  // GestureDetector(
                  //   onTap: controller.showImageSourceOptions,
                  //   child: Image.asset(
                  //     AppImages.attachfile_logo,
                  //     height: Get.height * 0.05,
                  //     width: Get.width * 0.1,
                  //   ),
                  // ),

                  // Text Input
                  Container(
                    height: Get.height * 0.1,
                    width: Get.width * 0.5,
                    child: TextFormField(
                      controller: controller.messageController,
                      onChanged: controller.handleInputChange,
                      decoration: InputDecoration(
                        hint: Center(child: Text('Write your message')),
                        border: InputBorder.none,
                        //hintText: 'Write your message',
                        // suffixIcon: Image.asset(
                        //   AppImages.message_input_logo,
                        //   height: Get.height * 0.03,
                        //   width: Get.width * 0.1,
                        // ),
                      ),
                    ),
                  ),

                  // Camera Button
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () =>
                            controller.pickAndSendImage(ImageSource.gallery),
                        child: Image.asset(
                          AppImages.cameralogo,
                          height: Get.height * 0.05,
                          width: Get.width * 0.08,
                        ),
                      ),

                      // Audio/Microphone Button (Long Press to Record)
                      Obx(
                        () => GestureDetector(
                          onLongPress: controller.startRecording,
                          onLongPressUp: controller.stopRecordingAndSend,
                          child: Image.asset(
                            AppImages.microphone_logo,
                            height: Get.height * 0.035,
                            width: Get.width * 0.08,
                            color: controller.isRecording.value
                                ? Colors.red
                                : null,
                          ),
                        ),
                      ),

                      // Send Button
                      Obx(
                        () => GestureDetector(
                          onTap: () {
                            if (controller.messageController.text
                                .trim()
                                .isNotEmpty) {
                              controller.sendMessage();
                            }
                          },
                          child: Container(
                            height: Get.height * 0.04,
                            width: Get.width * 0.09,
                            decoration: BoxDecoration(
                              color: AppColors.primarycolor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: controller.isSending.value
                                ? Center(
                                    child: SizedBox(
                                      height: Get.height * 0.025,
                                      width: Get.width * 0.05,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              Colors.white,
                                            ),
                                      ),
                                    ),
                                  )
                                : Icon(
                                    Icons.send,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build message content based on type
  Widget _buildMessageContent(message) {
    switch (message.messageType) {
      case 'image':
        return message.msg != null
            ? CachedNetworkImage(
                imageUrl: message.msg!,
                width: Get.width * 0.6,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  width: Get.width * 0.6,
                  height: 200,
                  child: Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => Container(
                  width: Get.width * 0.6,
                  height: 200,
                  color: Colors.grey[300],
                  child: Icon(Icons.error, color: Colors.red),
                ),
              )
            : Text(
                message.msg,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              );

      case 'audio':
        return message.msg != null
            ? _AudioPlayer(audioUrl: message.msg!)
            : Text(
                message.msg,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              );

      default:
        return Container(
          height: Get.height * 0.035,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.blueGrey.shade100.withOpacity(0.7),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Text(
              message.msg,
              style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 18),
            ),
          ),
        );
    }
  }
}

// Audio Player Widget
class _AudioPlayer extends StatefulWidget {
  final String audioUrl;

  const _AudioPlayer({required this.audioUrl});

  @override
  State<_AudioPlayer> createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<_AudioPlayer> {
  final FlutterSoundPlayer _player = FlutterSoundPlayer();
  bool isPlaying = false;
  bool _isPlayerInitialized = false;

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  Future<void> _initPlayer() async {
    try {
      await _player.openPlayer();
      _isPlayerInitialized = true;
    } catch (e) {
      print('Failed to initialize player: $e');
    }
  }

  @override
  void dispose() {
    if (_isPlayerInitialized) {
      _player.closePlayer();
    }
    super.dispose();
  }

  void _playPause() async {
    try {
      if (!_isPlayerInitialized) {
        await _initPlayer();
      }

      if (isPlaying) {
        await _player.pausePlayer();
        setState(() => isPlaying = false);
      } else {
        await _player.startPlayer(
          fromURI: widget.audioUrl,
          whenFinished: () {
            if (mounted) {
              setState(() => isPlaying = false);
            }
          },
        );
        setState(() => isPlaying = true);
      }
    } catch (e) {
      print('Error playing audio: $e');
      Get.snackbar(
        'Error',
        'Failed to play audio',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
              size: 32,
              color: Colors.blue,
            ),
            onPressed: _playPause,
          ),
          Text('Audio Message', style: GoogleFonts.inter(fontSize: 12)),
        ],
      ),
    );
  }
}
