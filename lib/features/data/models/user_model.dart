import 'package:echo_fix/features/domian/entities/users.dart';

class UserModel {
  final int userId;
  final String name;
  final String email;
  final String username;
  final DateTime createdAt;

  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.username,
    required this.createdAt,
  });

  UserModel.fromJson(Map<String, dynamic> json)
    : userId = json['userId'] as int,
      name = json['name'] as String,
      email = json['email'] as String,
      username = json['username'] as String,
      createdAt = json['createdAt'] as DateTime;

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'username': username,
      'createdAt': createdAt,
    };
  }

  UserModel.fromEntity(Users user)
    : userId = user.userId,
      name = user.name,
      email = user.email,
      username = user.username,
      createdAt = user.createdAt;

  Users toEntity() {
    return Users(
      userId: userId,
      name: name,
      username: username,
      email: email,
      createdAt: createdAt,
    );
  }
}
