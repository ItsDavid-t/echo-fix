import 'package:echo_fix/core/error/failure.dart';
import 'package:echo_fix/features/domain/repositories/user_repository.dart';
import 'package:fpdart/fpdart.dart';

class SignOut {
  final UserRepository repository;

  const SignOut(this.repository);

  Future<Either<Failure, void>> call() async {
    return await repository.signOut();
  }
}
