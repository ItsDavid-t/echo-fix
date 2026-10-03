import 'package:echo_fix/features/domain/entities/user_role.dart';

class UserRoleModel extends UserRole {
  UserRoleModel({required super.roleId, required super.roleName});

  factory UserRoleModel.fromJson(Map<String, dynamic> json) {
    return UserRoleModel(
      roleId: json['user_id'] as int,
      roleName: json['role'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'user_id': roleId, 'role': roleName};
  }

  factory UserRoleModel.fromEntity(UserRole userRole) {
    return UserRoleModel(roleId: userRole.roleId, roleName: userRole.roleName);
  }

  UserRole toEntity() {
    return UserRole(roleId: roleId, roleName: roleName);
  }
}
