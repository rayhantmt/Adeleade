// chat_room_model.dart
class ChatRoomResponse {
  final bool success;
  final String message;
  final ChatRoomData data;

  ChatRoomResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ChatRoomResponse.fromJson(Map<String, dynamic> json) {
    return ChatRoomResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: ChatRoomData.fromJson(json['data'] ?? {}),
    );
  }
}

class ChatRoomData {
  final List<ChatRoom> chatRooms;

  ChatRoomData({required this.chatRooms});

  factory ChatRoomData.fromJson(Map<String, dynamic> json) {
    return ChatRoomData(
      chatRooms: (json['chatRooms'] as List?)
              ?.map((room) => ChatRoom.fromJson(room))
              .toList() ??
          [],
    );
  }
}

class ChatRoom {
  final String id;
  final String roomType;
  final List<Participant> participants;
  final bool isActive;
  final String lastMessageTime;
  final String createdAt;
  final String updatedAt;
  final LastMessage? lastMessage;
  final EventInfo? eventId;
  final int unreadCount;

  ChatRoom({
    required this.id,
    required this.roomType,
    required this.participants,
    required this.isActive,
    required this.lastMessageTime,
    required this.createdAt,
    required this.updatedAt,
    this.lastMessage,
    this.eventId,
    required this.unreadCount,
  });

  factory ChatRoom.fromJson(Map<String, dynamic> json) {
    return ChatRoom(
      id: json['id'] ?? '',
      roomType: json['roomType'] ?? '',
      participants: (json['participants'] as List?)
              ?.map((p) => Participant.fromJson(p))
              .toList() ??
          [],
      isActive: json['isActive'] ?? false,
      lastMessageTime: json['lastMessageTime'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      lastMessage: json['lastMessage'] != null
          ? LastMessage.fromJson(json['lastMessage'])
          : null,
      eventId:
          json['eventId'] != null ? EventInfo.fromJson(json['eventId']) : null,
      unreadCount: json['unreadCount'] ?? 0,
    );
  }

  // Helper method to get chat name
  String getChatName(String currentUserId) {
    if (roomType == 'event' && eventId != null) {
      return eventId!.name;
    }
    // For direct chat, get the other participant's name
    final otherParticipant =
        participants.firstWhere((p) => p.id != currentUserId,
            orElse: () => participants.first);
    return otherParticipant.name;
  }

  // Helper method to get chat image
  String getChatImage(String currentUserId) {
    if (roomType == 'event' && eventId != null) {
      return eventId!.imageURL;
    }
    // For direct chat, get the other participant's photo
    final otherParticipant =
        participants.firstWhere((p) => p.id != currentUserId,
            orElse: () => participants.first);
    return otherParticipant.photoURL;
  }

  // Helper method to format time
  String getFormattedTime() {
    try {
      final DateTime messageTime = DateTime.parse(lastMessageTime);
      final DateTime now = DateTime.now();
      final difference = now.difference(messageTime);

      if (difference.inDays > 7) {
        return '${messageTime.day}/${messageTime.month}/${messageTime.year}';
      } else if (difference.inDays > 0) {
        return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
      } else if (difference.inHours > 0) {
        return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes} min ago';
      } else {
        return 'Just now';
      }
    } catch (e) {
      return '';
    }
  }
}

class Participant {
  final String id;
  final String name;
  final String photoURL;
  final String status;
  final String lastOnline;

  Participant({
    required this.id,
    required this.name,
    required this.photoURL,
    required this.status,
    required this.lastOnline,
  });

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      photoURL: json['photoURL'] ?? '',
      status: json['status'] ?? 'offline',
      lastOnline: json['lastOnline'] ?? '',
    );
  }
}

class LastMessage {
  final String id;
  final String chatRoomId;
  final Sender senderId;
  final String messageType;
  final String content;
  final bool isEdited;
  final bool isDeleted;
  final List<String> readBy;
  final String createdAt;
  final String updatedAt;

  LastMessage({
    required this.id,
    required this.chatRoomId,
    required this.senderId,
    required this.messageType,
    required this.content,
    required this.isEdited,
    required this.isDeleted,
    required this.readBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LastMessage.fromJson(Map<String, dynamic> json) {
    return LastMessage(
      id: json['id'] ?? '',
      chatRoomId: json['chatRoomId'] ?? '',
      senderId: Sender.fromJson(json['senderId'] ?? {}),
      messageType: json['messageType'] ?? 'text',
      content: json['content'] ?? '',
      isEdited: json['isEdited'] ?? false,
      isDeleted: json['isDeleted'] ?? false,
      readBy: (json['readBy'] as List?)?.cast<String>() ?? [],
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
}

class Sender {
  final String id;
  final String name;

  Sender({required this.id, required this.name});

  factory Sender.fromJson(Map<String, dynamic> json) {
    return Sender(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class EventInfo {
  final String id;
  final String name;
  final String eventDate;
  final String location;
  final String imageURL;

  EventInfo({
    required this.id,
    required this.name,
    required this.eventDate,
    required this.location,
    required this.imageURL,
  });

  factory EventInfo.fromJson(Map<String, dynamic> json) {
    return EventInfo(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      eventDate: json['eventDate'] ?? '',
      location: json['location'] ?? '',
      imageURL: json['imageURL'] ?? '',
    );
  }
}