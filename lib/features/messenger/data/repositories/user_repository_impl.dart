import 'package:gaana_messenger/core/entities/user_entity.dart';
import 'package:gaana_messenger/core/repositories/user_repository.dart';
import '../datasources/demo_user_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  final DemoUserDataSource dataSource;
  UserRepositoryImpl({required this.dataSource});
  @override
  Future<List<UserEntity>> getUsers() async {
    final models = await dataSource.fetchUsers();
    return models
        .map((model) => UserEntity(id: model.id, name: model.name))
        .toList();
  }
}
