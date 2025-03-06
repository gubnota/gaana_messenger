import '../entities/message_entity.dart';
import '../repositories/message_repository.dart';

class FetchMessagesUseCase {
  final MessageRepository repository;
  FetchMessagesUseCase(this.repository);
  Future<List<MessageEntity>> call(int userId) async {
    return repository.getMessagesForUser(userId);
  }
}
