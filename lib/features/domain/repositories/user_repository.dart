import 'package:echo_fix/features/domain/entities/users.dart';
import 'package:echo_fix/features/domain/entities/user_role.dart';

abstract class UserRepository {
  Future<Users?> getCurrentUser();

  Future<List<UserRole>> getUserRoles();

  Future<void> signIn({required String userName, required String password});

  Future<void> signOut();
}
