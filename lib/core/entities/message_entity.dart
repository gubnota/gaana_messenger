import 'base_entity.dart';

class MessageEntity extends BaseEntity {
  final int senderId;
  final String content;
  final DateTime timestamp;
  MessageEntity({
    required int id,
    required this.senderId,
    required this.content,
    required this.timestamp,
  }) : super(id);
}
