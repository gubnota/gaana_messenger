import 'package:gaana_messenger/core/entities/message_entity.dart';
import 'package:gaana_messenger/core/repositories/message_repository.dart';

import '../datasources/demo_message_datasource.dart';
import '../models/message_model.dart';

class MessageRepositoryImpl implements MessageRepository {
  final DemoMessageDataSource dataSource;
  MessageRepositoryImpl({required this.dataSource});
  @override
  Future<List<MessageEntity>> getMessagesForUser(int userId) async {
    final models = await dataSource.fetchMessages(userId);
    return models
        .map(
          (m) => MessageEntity(
            id: m.id,
            senderId: m.senderId,
            content: m.content,
            timestamp: m.timestamp,
          ),
        )
        .toList();
  }

  @override
  Future<void> sendMessage(MessageEntity message) async {
    await dataSource.sendMessage(message);
  }

  @override
  Future<void> deleteMessage(MessageEntity message) async {
    // no need to delete
  }
}
