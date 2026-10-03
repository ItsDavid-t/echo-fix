import 'package:echo_fix/features/domain/entities/users.dart';

class UserModel extends Users {
  UserModel({
    required super.userId,
    required super.name,
    required super.username,
    required super.email,
    required super.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'username': username,
      'created_at': createdAt.toIso8601String(),
    };
  }

  factory UserModel.fromEntity(Users user) {
    return UserModel(
      userId: user.userId,
      name: user.name,
      username: user.username,
      email: user.email,
      createdAt: user.createdAt,
    );
  }

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
