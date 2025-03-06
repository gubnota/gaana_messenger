import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class FetchUsersUseCase {
  final UserRepository repository;
  FetchUsersUseCase(this.repository);
  Future<List<UserEntity>> call() async {
    return repository.getUsers();
  }
}
