import 'package:echo_fix/core/error/failure.dart';
import 'package:echo_fix/features/data/datasources/user_remote_data_source.dart';
import 'package:echo_fix/features/domain/entities/user_role.dart';
import 'package:echo_fix/features/domain/entities/users.dart';
import 'package:echo_fix/features/domain/repositories/user_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<UserRole>>> getUserRoles() async {
    try {
      final userRoles = await remoteDataSource.getUserRoles();
      final roles = userRoles.map((role) => role.toEntity()).toList();
      return Right(roles);
    } catch (e) {
      return Left(ServerFailure('Error al obenter el rol del usuario'));
    }
  }

  @override
  Future<Either<Failure, void>> signIn({
    required String userName,
    required String password,
  }) async {
    try {
      await remoteDataSource.signIn(userName: userName, password: password);
      return Right(null);
    } catch (e) {
      return Left(ServerFailure('Error al iniciar sesión'));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      return remoteDataSource.signOut().then((_) => const Right(null));
    } catch (e) {
      return Left(ServerFailure('Error al cerrar sesión'));
    }
  }

  @override
  Future<Either<Failure, Users?>> getCurrentUser() async {
    try {
      final user = await remoteDataSource.getCurrentUser();
      final userEntity = user?.toEntity();
      return Right(userEntity);
    } catch (e) {
      return Left(ServerFailure('Error al obtener el usuario actual'));
    }
  }
}
