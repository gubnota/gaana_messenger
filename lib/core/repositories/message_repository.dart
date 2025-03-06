import '../entities/message_entity.dart';

abstract class MessageRepository {
  Future<List<MessageEntity>> getMessagesForUser(int userId);
  Future<void> sendMessage(MessageEntity message);
  Future<void> deleteMessage(MessageEntity message);
}
