import 'package:echo_fix/features/data/models/user_model.dart';
import 'package:echo_fix/features/data/models/user_role_model.dart';
import 'package:echo_fix/features/domain/entities/user_role.dart';
import 'package:echo_fix/features/domain/entities/users.dart';
import 'package:echo_fix/features/domain/repositories/user_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepositoryImpl implements UserRepository {
  final SupabaseClient supabase;

  UserRepositoryImpl({required this.supabase});
  @override
  Future<Users?> getCurrentUser() async {
    try {
      final currentUser = supabase.auth.currentUser;

      if (currentUser == null) {
        return null;
      }

      final response = await supabase
          .from('users')
          .select()
          .eq('id', currentUser.id)
          .single();

      return UserModel(
        userId: response['id'],
        username: response['username'],
        email: response['email'],
        name: response['name'],
        createdAt: DateTime.parse(response['created_at']),
      );
    } catch (e) {
      throw Exception('Error al obtener el usuario actual: $e');
    }
  }

  @override
  Future<void> signIn({
    required String userName,
    required String password,
  }) async {
    try {
      final response = await supabase
          .from('users')
          .select('email')
          .eq('username', userName)
          .single();
      await supabase.auth.signInWithPassword(
        password: password,
        email: response['email'],
      );
    } catch (e) {
      throw Exception('Error al iniciar sesión: $e');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await supabase.auth.signOut();
    } catch (e) {
      throw Exception('Error al cerrar sesión: $e');
    }
  }

  @override
  Future<List<UserRole>> getUserRoles() async {
    try {
      final currentUser = supabase.auth.currentUser;

      if (currentUser == null) {
        return [];
      }

      final response = await supabase
          .from('user_roles')
          .select()
          .eq('user_id', currentUser.id);

      return response.map<UserRole>((role) {
        return UserRoleModel(roleId: role['user_id'], roleName: role['role']);
      }).toList();
    } catch (e) {
      throw Exception('Error al obtener los roles del usuario: $e');
    }
  }
}
