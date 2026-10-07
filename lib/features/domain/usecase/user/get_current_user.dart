import 'package:echo_fix/core/error/failure.dart';
import 'package:echo_fix/features/domain/entities/users.dart';
import 'package:echo_fix/features/domain/repositories/user_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetCurrentUser {
  final UserRepository repository;

  const GetCurrentUser(this.repository);

  Future<Either<Failure, Users?>> call() async {
    return await repository.getCurrentUser();
  }
}
