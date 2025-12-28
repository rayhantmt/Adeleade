import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mementum/modules/chat_room/chat_room_model.dart';
import 'package:mementum/routes/app_pages.dart';

class ChatController extends GetxController {
  var chatRooms = <ChatRoom>[].obs;
  var isLoading = false.obs;
  var currentUserId = ''.obs;
  
void printToken() {
  
  final id = GetStorage().read('id'); // read the saved token
  print('Saved id: $id'); // prints it
}
  @override
  void onInit() {
    super.onInit();
    // TODO: Get current user ID from your auth service
    // Example: currentUserId.value = Get.find<AuthController>().userId.value;
    currentUserId.value = GetStorage().read('id'); // Replace with actual user ID
    fetchChatRooms();
  }

  Future<void> fetchChatRooms() async {
    final storage = GetStorage();
  final token = storage.read('token'); 
    try {
      isLoading.value = true;
      
      // Replace with your actual API endpoint and add auth token
      final response = await http.get(
        Uri.parse('https://server.momentumactivity.com/api/v1/chat/my-chats'),
        headers: {
          'Content-Type': 'application/json',
           'Authorization': token,
        },
      );

      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

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

  // Navigate to chat details
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

  // Refresh chat rooms (for pull-to-refresh)
  Future<void> refreshChatRooms() async {
    await fetchChatRooms();
  }

  // Optional: Search functionality
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