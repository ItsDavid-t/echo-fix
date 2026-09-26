import 'package:echo_fix/features/domian/entities/user_role.dart';

class UserRoleModel {
  final int roleId;
  final String roleName;

  UserRoleModel({required this.roleId, required this.roleName});

  UserRoleModel.fromJson(Map<String, dynamic> json)
    : roleId = json['roleId'] as int,
      roleName = json['roleName'] as String;

  Map<String, dynamic> toJson() {
    return {'roleId': roleId, 'roleName': roleName};
  }

  UserRoleModel.fromEntity(UserRole userRole)
    : roleId = userRole.roleId,
      roleName = userRole.roleName;

  UserRole toEntity() {
    return UserRole(roleId: roleId, roleName: roleName);
  }
}
