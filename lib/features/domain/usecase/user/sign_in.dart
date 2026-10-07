import 'package:echo_fix/core/error/failure.dart';
import 'package:echo_fix/features/domain/repositories/user_repository.dart';
import 'package:fpdart/fpdart.dart';

class SignIn {
  final UserRepository repository;

  const SignIn(this.repository);

  Future<Either<Failure, void>> call({
    required String userName,
    required String password,
  }) async {
    return await repository.signIn(userName: userName, password: password);
  }
}
