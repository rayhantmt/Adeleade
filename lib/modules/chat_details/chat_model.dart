class ChatModel {
  final String msg;
  final String time;
  final String img;
  final bool isme;
  final String name;
  final String messageType;  // ADD THIS
  final String? mediaURL;     // ADD THIS

  ChatModel({
    required this.msg,
    required this.time,
    required this.img,
    required this.isme,
    required this.name,
    this.messageType = 'text',  // ADD THIS
    this.mediaURL,              // ADD THIS
  });
}