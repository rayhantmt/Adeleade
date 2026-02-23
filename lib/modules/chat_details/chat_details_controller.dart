import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:mementum/modules/chat_details/chat_details_model.dart';
import 'package:mementum/modules/home/home_model.dart';
import 'package:mementum/routes/app_pages.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mementum/modules/chat_details/chat_model.dart';
import 'package:mementum/services/socket_service.dart';

class ChatDetailsController extends GetxController {
  late String img;
  late String name;
  late String roomId;
  late String roomType;
  late String eventId;

  var msgs = <ChatModel>[].obs;
  var messages = <Message>[].obs;
  var isLoading = false.obs;
  var isSending = false.obs;
  var isRecording = false.obs;
  var isTyping = false.obs;
  var otherUserTyping = false.obs;
  var currentUserId = ''.obs;

  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final ImagePicker _imagePicker = ImagePicker();
  final FlutterSoundRecorder _audioRecorder = FlutterSoundRecorder();

  bool _isRecorderInitialized = false;
  Timer? _typingTimer;
  String? _audioPath;

  @override
  void onInit() {
    super.onInit();
    var args = Get.arguments;
    img = args['image'] ?? '';
    name = args['name'] ?? '';
    roomId = args['roomId'] ?? '';
    roomType = args['roomType'] ?? 'direct';
    eventId = args['eventId'] ?? "noeveentId";

    currentUserId.value = GetStorage().read('id');

    _initializeChat();
  }

  @override
  void onClose() {
    messageController.dispose();
    scrollController.dispose();
    _typingTimer?.cancel();
    if (_isRecorderInitialized) {
      _audioRecorder.closeRecorder();
    }
    _cleanupSocketListeners();
    socketService.leaveChatRoom(roomId);
    super.onClose();
  }

  Future<void> fetchEventAndNavigate(String eventId) async {
    bool isEvent = roomType == 'event';

  // 2. If it's NOT an event, stop here and don't navigate to event details
  if (!isEvent) {
    print("Room type is direct. Skipping event detail fetch.");
    // You could navigate to a profile page or chat settings here if needed
    return; 
  }
    final token = GetStorage().read('token');

    try {
      // 1. Show loading overlay
      Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

      final response = await http.get(
        Uri.parse('https://server.momentumactivity.com/api/v1/event/$eventId'),
        headers: {"Authorization": token}, // Replace with your actual endpoint
      );
      print(response.body);
      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = json.decode(response.body);

        // 2. Parse the 'data' object using your existing Factory
        final event = Event.fromJson(decodedData['data']);

        if (Get.isDialogOpen!) {
          Get.back();
        }

        // 4. Navigate using the arguments your DetailController.onInit expects
        Get.toNamed(
          AppPages.eventdetails,
          arguments: {
            'image': event.image,
            'tittle': event.title,
            'time': event.dateTime,
            'location': event.location,
            'eventDeatils': event.details, // Matches your 'details' in model
            'hostedby': event.organizerName,
            'hostphotourl': event.organizerPhoto,
            'joinedpeople': event.joinedPeople,
            'maxpeople': event.maxPeople,
            'id': event.id,
            'perticanpants': event.participants, // Pass the List<Participant>
            'hostid': event.organizerId,
          },
        );
      } else {
        Get.back();
        Get.snackbar("Error", "Could not fetch event details");
      }
    } catch (e) {
      Get.back();
      print("Error fetching event: $e");
      Get.snackbar("Error", "Something went wrong");
    }
  }

  Future<void> _initializeChat() async {
    try {
      // Initialize audio recorder
      await _initRecorder();

      // Connect socket if not connected
      if (!socketService.isConnected) {
        await socketService.connect();
      }

      socketService.joinChatRoom(roomId);
      _setupSocketListeners();
      await fetchMessages();
    } catch (e) {
      print('❌ Error initializing chat: $e');
      Get.snackbar(
        'Error',
        'Failed to initialize chat',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> _initRecorder() async {
    try {
      await _audioRecorder.openRecorder();
      _isRecorderInitialized = true;
      print('✅ Audio recorder initialized');
    } catch (e) {
      print('❌ Failed to initialize recorder: $e');
    }
  }

  void _setupSocketListeners() {
    socketService.on('new_message', _handleNewMessage);
    socketService.on('message_edited', _handleMessageEdited);
    socketService.on('message_deleted', _handleMessageDeleted);
    socketService.on('user_typing', _handleUserTyping);
    socketService.on('message_read', _handleMessageRead);
  }

  void _cleanupSocketListeners() {
    socketService.off('new_message');
    socketService.off('message_edited');
    socketService.off('message_deleted');
    socketService.off('user_typing');
    socketService.off('message_read');
  }

  void _handleNewMessage(dynamic data) {
    print('📨 New message received: $data');

    try {
      final message = Message.fromJson(data);

      if (message.chatRoomId == roomId) {
        messages.insert(0, message);

        final chatModel = ChatModel(
          msg: message.content,
          time: message.getFormattedTime(),
          isme: message.isFromMe(currentUserId.value),
          img: message.senderId.photoURL ?? '',
          name: message.senderId.name,
          messageType: message.messageType,
          mediaURL: message.mediaURL,
        );

        msgs.insert(0, chatModel);

        if (message.senderId.id != currentUserId.value) {
          socketService.markMessageAsRead(message.id, roomId);
        }

        _scrollToBottom();
      }
    } catch (e) {
      print('❌ Error handling new message: $e');
    }
  }

  void _handleMessageEdited(dynamic data) {
    print('✏️ Message edited: $data');
    try {
      final editedMessage = Message.fromJson(data);
      final index = messages.indexWhere((m) => m.id == editedMessage.id);
      if (index != -1) {
        messages[index] = editedMessage;
        msgs[index] = ChatModel(
          msg: editedMessage.content,
          time: editedMessage.getFormattedTime(),
          isme: editedMessage.isFromMe(currentUserId.value),
          img: editedMessage.senderId.photoURL ?? '',
          name: editedMessage.senderId.name,
          messageType: editedMessage.messageType,
          mediaURL: editedMessage.mediaURL,
        );
      }
    } catch (e) {
      print('❌ Error handling edited message: $e');
    }
  }

  void _handleMessageDeleted(dynamic data) {
    print('🗑️ Message deleted: $data');
    try {
      final messageId = data['messageId'] as String;
      final chatRoomId = data['chatRoomId'] as String;

      if (chatRoomId == roomId) {
        final index = messages.indexWhere((m) => m.id == messageId);
        if (index != -1) {
          final deletedMsg = messages[index];
          msgs[index] = ChatModel(
            msg: 'This message was deleted',
            time: deletedMsg.getFormattedTime(),
            isme: deletedMsg.isFromMe(currentUserId.value),
            img: deletedMsg.senderId.photoURL ?? '',
            name: deletedMsg.senderId.name,
            messageType: 'text',
            mediaURL: null,
          );
        }
      }
    } catch (e) {
      print('❌ Error handling deleted message: $e');
    }
  }

  void _handleUserTyping(dynamic data) {
    try {
      final userId = data['userId'] as String;
      final typing = data['isTyping'] as bool;

      if (userId != currentUserId.value) {
        otherUserTyping.value = typing;
      }
    } catch (e) {
      print('❌ Error handling typing: $e');
    }
  }

  void _handleMessageRead(dynamic data) {
    try {
      final messageId = data['messageId'] as String;
      final userId = data['userId'] as String;

      final index = messages.indexWhere((m) => m.id == messageId);
      if (index != -1 && !messages[index].readBy.contains(userId)) {
        messages[index].readBy.add(userId);
        messages.refresh();
      }
    } catch (e) {
      print('❌ Error handling message read: $e');
    }
  }

  Future<void> fetchMessages() async {
    final storage = GetStorage();
    final token = storage.read('token');

    try {
      isLoading.value = true;

      final response = await http.get(
        Uri.parse(
          'https://server.momentumactivity.com/api/v1/chat/$roomId/messages',
        ),
        headers: {'Content-Type': 'application/json', 'Authorization': token},
      );

      print('Messages Response: ${response.statusCode}');
      print('Messages Response ${response.body}');

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        if (jsonData['success'] == true && jsonData['data'] != null) {
          final messagesList = (jsonData['data']['messages'] as List)
              .map((msg) => Message.fromJson(msg))
              .toList()
              .reversed
              .toList();

          messages.value = messagesList;

          msgs.value = messages.map((message) {
            return ChatModel(
              msg: message.content,
              time: message.getFormattedTime(),
              isme: message.isFromMe(currentUserId.value),
              img: message.senderId.photoURL ?? '',
              name: message.senderId.name,
              messageType: message.messageType,
              mediaURL: message.mediaURL,
            );
          }).toList();

          print('✅ Messages loaded: ${msgs.length}');
        }
      }
    } catch (e) {
      print('❌ Error fetching messages: $e');
      Get.snackbar(
        'Error',
        'Failed to load messages',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void handleInputChange(String text) {
    if (text.isNotEmpty && !isTyping.value) {
      socketService.sendTyping(roomId, true);
      isTyping.value = true;
    }

    _typingTimer?.cancel();
    _typingTimer = Timer(Duration(seconds: 2), () {
      if (isTyping.value) {
        socketService.sendTyping(roomId, false);
        isTyping.value = false;
      }
    });
  }

  Future<void> sendMessage() async {
    final content = messageController.text.trim();
    if (content.isEmpty) return;

    final storage = GetStorage();
    final token = storage.read('token');

    try {
      isSending.value = true;
      messageController.clear();

      if (isTyping.value) {
        socketService.sendTyping(roomId, false);
        isTyping.value = false;
      }

      final response = await http.post(
        Uri.parse('https://server.momentumactivity.com/api/v1/chat/send'),
        headers: {'Content-Type': 'application/json', 'Authorization': token},
        body: json.encode({
          'chatRoomId': roomId,
          'contentType': 'text',
          'content': content,
          'messageType': 'text',
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('✅ Message sent');
      } else {
        throw Exception('Failed to send message ${response.body}');
      }
    } catch (e) {
      print('❌ Error sending message: $e');
      Get.snackbar(
        'Error',
        'Failed to send message $e',
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 5),
      );
      messageController.text = content;
    } finally {
      isSending.value = false;
    }
  }

  Future<void> pickAndSendImage(ImageSource source) async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: source,
        imageQuality: 80,
      );
      if (image == null) return;

      await _uploadAndSendMedia(File(image.path), 'image');
    } catch (e) {
      print('❌ Error picking image: $e');
      Get.snackbar(
        'Error',
        'Failed to pick image',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> startRecording() async {
    try {
      if (await Permission.microphone.request().isGranted) {
        if (!_isRecorderInitialized) {
          await _initRecorder();
        }

        final tempDir = await getTemporaryDirectory();
        _audioPath =
            '${tempDir.path}/audio_${DateTime.now().millisecondsSinceEpoch}.aac';

        await _audioRecorder.startRecorder(
          toFile: _audioPath,
          codec: Codec.aacADTS,
        );

        isRecording.value = true;
        print('🎤 Recording started');
      } else {
        Get.snackbar(
          'Permission Denied',
          'Microphone permission is required',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print('❌ Error starting recording: $e');
      Get.snackbar(
        'Error',
        'Failed to start recording',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> stopRecordingAndSend() async {
    try {
      final path = await _audioRecorder.stopRecorder();
      isRecording.value = false;

      if (path != null && File(path).existsSync()) {
        print('🎤 Recording stopped: $path');
        await _uploadAndSendMedia(File(path), 'audio');
      }
    } catch (e) {
      print('❌ Error stopping recording: $e');
      Get.snackbar(
        'Error',
        'Failed to stop recording',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> cancelRecording() async {
    try {
      await _audioRecorder.stopRecorder();
      isRecording.value = false;
      print('🎤 Recording cancelled');
    } catch (e) {
      print('❌ Error cancelling recording: $e');
    }
  }

  Future<void> _uploadAndSendMedia(File file, String type) async {
    final storage = GetStorage();
    final token = storage.read('token');

    try {
      isSending.value = true;

      // Create Dio instance
      final dio = Dio();

      // Create FormData
      final formData = FormData.fromMap({
        'chatRoomId': roomId,
        'messageType': type, // 'image' or 'audio'
        //'file': file, //== 'image' ? 'Image' : 'Audio',
        // 'file': await MultipartFile.fromFile(
        //   file.path

        // ),
        'file': await MultipartFile.fromFile(
          file.path,
          // filename: 'nothing',
          //contentType: MediaType('image', 'png'),
        ),
      });

      print('⏳ Sending $type');
      print('📝 chatRoomId: $roomId');
      print('📝 messageType: $type');

      // Send request
      final response = await dio.post(
        options: Options(
          headers: {
            'Authorization': token,
            // 'Content-Type': 'application/json',
          },
        ),
        'https://server.momentumactivity.com/api/v1/chat/send',
        data: formData,
      );
      print(formData);
      print(file.path);
      print('📨 Status: ${response.statusCode}');
      print('📨 Body: ${response.data}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('✅ $type sent successfully');
      } else {
        throw Exception('Failed: ${response.data}');
      }
    } catch (e) {
      print('❌ Error: $e');
      if (e is DioException) {
        print('❌ Dio Error Response: ${e.response?.data}');
      }
      Get.snackbar(
        'Error',
        'Failed to send $type',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
      );
    } finally {
      isSending.value = false;
    }
  }

  void showImageSourceOptions() {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt, color: Colors.blue),
              title: Text('Camera'),
              onTap: () {
                Get.back();
                pickAndSendImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library, color: Colors.green),
              title: Text('Gallery'),
              onTap: () {
                Get.back();
                pickAndSendImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          0,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> refreshMessages() async {
    await fetchMessages();
  }
}
