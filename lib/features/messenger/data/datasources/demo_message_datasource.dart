import 'package:gaana_messenger/core/entities/message_entity.dart';
import 'package:gaana_messenger/features/messenger/data/models/message_model.dart';

abstract class DemoMessageDataSource {
  Future<List<MessageModel>> fetchMessages(int userId);
  Future<void> sendMessage(MessageEntity message);
}

class DemoMessageDataSourceImpl implements DemoMessageDataSource {
  final List<MessageModel> _messages = [];
  @override
  Future<List<MessageModel>> fetchMessages(int userId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _messages.where((m) => m.senderId == userId).toList();
  }

  @override
  Future<void> sendMessage(MessageEntity message) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _messages.add(
      MessageModel(
        id: message.id,
        senderId: message.senderId,
        content: message.content,
        timestamp: message.timestamp,
      ),
    );
  }
}
