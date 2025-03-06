import '../entities/message_entity.dart';
import '../repositories/message_repository.dart';

class SendMessageUseCase {
  final MessageRepository repository;
  SendMessageUseCase(this.repository);
  Future<void> call(MessageEntity message) async {
    await repository.sendMessage(message);
  }
}
