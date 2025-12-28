// message_model.dart

class MessageResponse {
  final bool success;
  final String message;
  final MessageData data;

  MessageResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory MessageResponse.fromJson(Map<String, dynamic> json) {
    return MessageResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: MessageData.fromJson(json['data'] ?? {}),
    );
  }
}

class MessageData {
  final List<Message> messages;

  MessageData({required this.messages});

  factory MessageData.fromJson(Map<String, dynamic> json) {
    return MessageData(
      messages: (json['messages'] as List?)
              ?.map((msg) => Message.fromJson(msg))
              .toList() ??
          [],
    );
  }
}

class Message {
  final String id;
  final String chatRoomId;
  final MessageSender senderId;
  final String messageType;
  final String content;
  final bool isEdited;
  final bool isDeleted;
  final List<String> readBy;
  final String createdAt;
  final String updatedAt;
  final String? mediaURL;
  final Map<String, dynamic>? metadata;

  Message({
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
    this.mediaURL,
    this.metadata,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'] ?? '',
      chatRoomId: json['chatRoomId'] ?? '',
      senderId: MessageSender.fromJson(json['senderId'] ?? {}),
      messageType: json['messageType'] ?? 'text',
      content: json['content'] ?? '',
      isEdited: json['isEdited'] ?? false,
      isDeleted: json['isDeleted'] ?? false,
      readBy: (json['readBy'] as List?)?.cast<String>() ?? [],
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      mediaURL: json['mediaURL'],
      metadata: json['metadata'],
    );
  }

  // Helper method to check if message is from current user
  bool isFromMe(String currentUserId) {
    return senderId.id == currentUserId;
  }

  // Helper method to format time
  String getFormattedTime() {
    try {
      final DateTime messageTime = DateTime.parse(createdAt);
      final hour = messageTime.hour > 12 ? messageTime.hour - 12 : messageTime.hour;
      final period = messageTime.hour >= 12 ? 'PM' : 'AM';
      final minute = messageTime.minute.toString().padLeft(2, '0');
      return '$hour:$minute $period';
    } catch (e) {
      return '';
    }
  }

  // Helper method to format date
  String getFormattedDate() {
    try {
      final DateTime messageTime = DateTime.parse(createdAt);
      final DateTime now = DateTime.now();
      final difference = now.difference(messageTime);

      if (difference.inDays == 0) {
        return 'Today';
      } else if (difference.inDays == 1) {
        return 'Yesterday';
      } else if (difference.inDays < 7) {
        final days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
        return days[messageTime.weekday % 7];
      } else {
        return '${messageTime.day}/${messageTime.month}/${messageTime.year}';
      }
    } catch (e) {
      return '';
    }
  }
}

class MessageSender {
  final String id;
  final String name;
  final String? photoURL;

  MessageSender({
    required this.id,
    required this.name,
    this.photoURL,
  });

  factory MessageSender.fromJson(Map<String, dynamic> json) {
    return MessageSender(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      photoURL: json['photoURL'],
    );
  }
}

// For sending new messages
class SendMessageRequest {
  final String chatRoomId;
  final String content;
  final String messageType;
  final String? mediaURL;

  SendMessageRequest({
    required this.chatRoomId,
    required this.content,
    this.messageType = 'text',
    this.mediaURL,
  });

  Map<String, dynamic> toJson() {
    return {
      'chatRoomId': chatRoomId,
      'content': content,
      'messageType': messageType,
      if (mediaURL != null) 'mediaURL': mediaURL,
    };
  }
}