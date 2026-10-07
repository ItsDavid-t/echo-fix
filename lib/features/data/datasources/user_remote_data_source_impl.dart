import 'package:echo_fix/features/data/datasources/user_remote_data_source.dart';
import 'package:echo_fix/features/data/models/user_model.dart';
import 'package:echo_fix/features/data/models/user_role_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final SupabaseClient supabase;
  final String userTable = 'users';
  UserRemoteDataSourceImpl({required this.supabase});

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      final currentUser = supabase.auth.currentUser;

      if (currentUser == null) {
        return null;
      }

      final response = await supabase
          .from(userTable)
          .select()
          .eq('id', currentUser.id)
          .single();

      return UserModel.fromJson(response);
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
          .from(userTable)
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
  Future<List<UserRoleModel>> getUserRoles() async {
    try {
      final currentUser = supabase.auth.currentUser;

      if (currentUser == null) {
        return [];
      }

      final response = await supabase
          .from('user_roles')
          .select()
          .eq('user_id', currentUser.id);

      return response.map<UserRoleModel>((role) {
        return UserRoleModel(roleId: role['user_id'], roleName: role['role']);
      }).toList();
    } catch (e) {
      throw Exception('Error al obtener los roles del usuario: $e');
    }
  }
}
