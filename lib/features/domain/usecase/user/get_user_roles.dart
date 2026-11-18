import 'package:echo_fix/core/error/failure.dart';
import 'package:echo_fix/features/domain/entities/user_role.dart';
import 'package:echo_fix/features/domain/repositories/user_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetUserRoles {
  final UserRepository repository;

  const GetUserRoles(this.repository);

  Future<Either<Failure, List<UserRole>>> call() async {
    return await repository.getUserRoles();
  }
}
