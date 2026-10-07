import 'package:echo_fix/features/domain/entities/user_role.dart';
import 'package:echo_fix/features/domain/repositories/user_repository.dart';

class GetUserRoles {
  final UserRepository repository;

  const GetUserRoles(this.repository);

  Future<List<UserRole>> call() async {
    return await repository.getUserRoles();
  }
}
