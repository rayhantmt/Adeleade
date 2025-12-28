import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mementum/modules/chat_room/chat_room_model.dart';
import 'package:mementum/routes/app_pages.dart';
import 'package:mementum/services/socket_service.dart';  // ADD THIS

class ChatController extends GetxController {
  var chatRooms = <ChatRoom>[].obs;
  var isLoading = false.obs;
  var currentUserId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    currentUserId.value = GetStorage().read('id');
    
    // Initialize socket and fetch chats
    _initializeChat();
  }

  @override
  void onClose() {
    // Clean up socket listeners
    socketService.off('new_message');
    socketService.off('chat_room_updated');
    super.onClose();
  }

  // NEW: Initialize chat with socket
  Future<void> _initializeChat() async {
    // Connect socket if not connected
    if (!socketService.isConnected) {
      await socketService.connect();
    }
    
    // Setup socket listeners for real-time updates
    _setupSocketListeners();
    
    // Fetch chat rooms
    await fetchChatRooms();
  }

  // NEW: Setup socket event listeners
  void _setupSocketListeners() {
    // Listen for new messages to update chat list
    socketService.on('new_message', (data) {
      print('📨 New message in chat list: $data');
      // Refresh chat rooms to update last message
      fetchChatRooms();
    });
    
    // Listen for chat room updates
    socketService.on('chat_room_updated', (data) {
      print('🔄 Chat room updated: $data');
      fetchChatRooms();
    });
  }

  Future<void> fetchChatRooms() async {
    final storage = GetStorage();
    final token = storage.read('token'); 
    
    try {
      isLoading.value = true;
      
      final response = await http.get(
        Uri.parse('https://server.momentumactivity.com/api/v1/chat/my-chats'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token,
        },
      );

      print('Response Status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final chatRoomResponse = ChatRoomResponse.fromJson(jsonData);
        
        if (chatRoomResponse.success) {
          chatRooms.value = chatRoomResponse.data.chatRooms;
          print('Chat rooms loaded: ${chatRooms.length}');
        } else {
          Get.snackbar(
            'Error',
            chatRoomResponse.message,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } else {
        Get.snackbar(
          'Error',
          'Failed to load chat rooms. Status: ${response.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print('Error fetching chat rooms: $e');
      Get.snackbar(
        'Error',
        'Something went wrong: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void openChatDetails(ChatRoom chatRoom) {
    final chatName = chatRoom.getChatName(currentUserId.value);
    final chatImage = chatRoom.getChatImage(currentUserId.value);
    
    Get.toNamed(
      AppPages.chatdetails,
      arguments: {
        'roomId': chatRoom.id,
        'name': chatName,
        'image': chatImage,
        'roomType': chatRoom.roomType,
        'eventId': chatRoom.eventId?.id ?? '',
        'participants': chatRoom.participants,
      },
    );
  }

  Future<void> refreshChatRooms() async {
    await fetchChatRooms();
  }

  var searchQuery = ''.obs;
  
  List<ChatRoom> get filteredChatRooms {
    if (searchQuery.value.isEmpty) {
      return chatRooms;
    }
    return chatRooms.where((room) {
      final name = room.getChatName(currentUserId.value).toLowerCase();
      final query = searchQuery.value.toLowerCase();
      return name.contains(query);
    }).toList();
  }
}