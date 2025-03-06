import 'package:gaana_messenger/core/entities/message_entity.dart';
import 'package:gaana_messenger/core/repositories/message_repository.dart';

class DeleteMessageUseCase {
  final MessageRepository repository;
  DeleteMessageUseCase(this.repository);
  Future<void> call(MessageEntity message) async {
    await repository.deleteMessage(message);
  }
}
