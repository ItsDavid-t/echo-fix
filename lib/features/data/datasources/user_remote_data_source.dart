import 'package:echo_fix/features/data/models/user_model.dart';
import 'package:echo_fix/features/data/models/user_role_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel?> getCurrentUser();

  Future<List<UserRoleModel>> getUserRoles();

  Future<void> signIn({required String userName, required String password});

  Future<void> signOut();
}
