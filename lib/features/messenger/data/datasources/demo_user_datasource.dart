import '../models/user_model.dart';

abstract class DemoUserDataSource {
  Future<List<UserModel>> fetchUsers();
}

class DemoUserDataSourceImpl implements DemoUserDataSource {
  @override
  Future<List<UserModel>> fetchUsers() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      UserModel(id: 1, name: "Alice"),
      UserModel(id: 2, name: "Bob"),
      UserModel(id: 3, name: "Charlie"),
    ];
  }
}
