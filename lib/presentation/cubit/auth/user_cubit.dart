import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends UserState {
  const AuthInitial();
}

class AuthLoading extends UserState {
  const AuthLoading();
}
