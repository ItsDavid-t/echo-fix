import 'package:echo_fix/core/error/failure.dart';
import 'package:echo_fix/features/data/datasources/customer_remote_data_source_impl.dart';
import 'package:echo_fix/features/data/models/customer_model.dart';
import 'package:echo_fix/features/domain/entities/customer.dart';
import 'package:echo_fix/features/domain/repositories/customer_repositry.dart';
import 'package:fpdart/fpdart.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerRemoteDataSourceImpl remoteDataSource;
  CustomerRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, void>> addCustomer(Customer customer) async {
    try {
      final customerModel = CustomerModel.fromEntity(customer);
      return await remoteDataSource
          .addCustomer(customerModel)
          .then((_) => const Right(null));
    } catch (e) {
      return Left(ServerFailure('Error al agregar el cliente: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCustomer(int customerId) async {
    try {
      return await remoteDataSource
          .deleteCustomer(customerId)
          .then((_) => const Right(null));
    } catch (e) {
      return Left(ServerFailure('Error al eliminar el cliente: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Customer>>> getAllCustomers() async {
    try {
      return await remoteDataSource.getAllCustomers().then((customerModels) {
        final customers = customerModels
            .map((model) => model.toEntity())
            .toList();
        return Right(customers);
      });
    } catch (e) {
      return Left(ServerFailure('Error al obtener los clientes: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateCustomer(Customer customer) async {
    try {
      final customerModel = CustomerModel.fromEntity(customer);
      return remoteDataSource
          .updateCustomer(customerModel)
          .then((_) => const Right(null));
    } catch (e) {
      return Left(ServerFailure('Error al actualizar el cliente: $e'));
    }
  }
}
