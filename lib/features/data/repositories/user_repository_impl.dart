import 'package:echo_fix/features/domian/entities/user_role.dart';
import 'package:echo_fix/features/domian/entities/users.dart';
import 'package:echo_fix/features/domian/repositories/user_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepositoryImpl implements UserRepository {
  final SupabaseClient supabase;

  UserRepositoryImpl({required this.supabase});
  @override
  Future<Users?> getCurrentUser() async {
    final currentUser = supabase.auth.currentUser;

    if (currentUser == null) {
      return null;
    }

    final response = await supabase
        .from('users')
        .select()
        .eq('id', currentUser.id)
        .single();

    return Users(
      userId: response['id'],
      username: response['username'],
      email: response['email'],
      name: response['name'],
      createdAt: DateTime.parse(response['created_at']),
    );
  }

  @override
  Future<void> signIn({
    required String userName,
    required String password,
  }) async {
    final response = await supabase
        .from('users')
        .select('email')
        .eq('username', userName)
        .single();
    await supabase.auth.signInWithPassword(
      password: password,
      email: response['email'],
    );
  }

  @override
  Future<void> signOut() async {
    final SupabaseClient supabaseClient = Supabase.instance.client;
    await supabaseClient.auth.signOut();
  }

  @override
  Future<List<UserRole>> getUserRoles() async {
    final currentUser = supabase.auth.currentUser;

    if (currentUser == null) {
      return [];
    }

    final response = await supabase
        .from('user_roles')
        .select()
        .eq('user_id', currentUser.id);

    return response.map<UserRole>((role) {
      return UserRole(roleId: role['user_id'], roleName: role['role']);
    }).toList();
  }
}
