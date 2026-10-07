import 'package:echo_fix/core/error/failure.dart';
import 'package:echo_fix/features/domain/entities/users.dart';
import 'package:echo_fix/features/domain/entities/user_role.dart';
import 'package:fpdart/fpdart.dart';

abstract class UserRepository {
  Future<Either<Failure, Users?>> getCurrentUser();

  Future<Either<Failure, List<UserRole>>> getUserRoles();

  Future<Either<Failure, void>> signIn({
    required String userName,
    required String password,
  });

  Future<Either<Failure, void>> signOut();
}
