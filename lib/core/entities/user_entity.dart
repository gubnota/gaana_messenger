import 'base_entity.dart';

class UserEntity extends BaseEntity {
  final String name;
  final bool isAvailable; // Always true in demo.
  UserEntity({required int id, required this.name, this.isAvailable = true})
    : super(id);
}
