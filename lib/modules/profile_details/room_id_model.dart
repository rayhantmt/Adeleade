class ChatRoom {
  final String roomType;
  final String roomId;

  ChatRoom({
    required this.roomType,
    required this.roomId,
  });

  factory ChatRoom.fromJson(Map<String, dynamic> json) {
    return ChatRoom(
      roomType: json['data']['roomType'] ?? '',
      roomId: json['data']['id'] ?? '',
    );
  }
}