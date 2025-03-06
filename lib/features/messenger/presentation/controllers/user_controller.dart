import 'package:gaana/gaana.dart';
import 'package:gaana_messenger/core/entities/user_entity.dart';
import 'package:gaana_messenger/core/use_cases/fetch_users_use_case.dart';

class UserController extends GaanaNotifier {
  final FetchUsersUseCase fetchUsersUseCase;
  List<UserEntity> users = [];
  UserController({required this.fetchUsersUseCase});
  Future<void> loadUsers() async {
    users = await fetchUsersUseCase();
  }
}
