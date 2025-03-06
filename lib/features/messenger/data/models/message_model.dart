class MessageModel {
  final int id;
  final int senderId;
  final String content;
  final DateTime timestamp;
  MessageModel({
    required this.id,
    required this.senderId,
    required this.content,
    required this.timestamp,
  });
}
