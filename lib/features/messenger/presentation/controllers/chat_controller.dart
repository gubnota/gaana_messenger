import 'package:gaana/example.dart';
import 'package:gaana_messenger/core/entities/message_entity.dart';
import 'package:gaana_messenger/core/entities/user_entity.dart';
import 'package:gaana_messenger/core/use_cases/bot_response_use_case.dart';
import 'package:gaana_messenger/core/use_cases/delete_message_use_case.dart';
import 'package:gaana_messenger/core/use_cases/fetch_messages_use_case.dart';
import 'package:gaana_messenger/core/use_cases/send_message_use_case.dart';

class ChatController extends GaanaNotifier {
  final FetchMessagesUseCase fetchMessagesUseCase;
  final SendMessageUseCase sendMessageUseCase;
  final DeleteMessageUseCase deleteMessageUseCase;
  final BotResponseUseCase botResponseUseCase;
  List<MessageEntity> messages = [];
  ChatController({
    required this.fetchMessagesUseCase,
    required this.sendMessageUseCase,
    required this.deleteMessageUseCase,
    required this.botResponseUseCase,
  });
  Future<void> loadMessages(int userId) async {
    messages = await fetchMessagesUseCase(userId);
  }

  Future<void> sendMessage(MessageEntity message) async {
    await sendMessageUseCase(message);
    messages.add(message);
    notify();
  }

  Future<void> deleteMessage(MessageEntity message) async {
    await deleteMessageUseCase(message);
    messages.removeWhere((msg) => msg.id == message.id);
    notify();
  }

  Future<void> sendBotResponse(UserEntity user) async {
    final botMessage = botResponseUseCase.execute(user);
    messages.add(botMessage);
    notify();
  }
}
