import 'package:echo_fix/features/domain/entities/customer.dart';
import 'package:echo_fix/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class CustomerRepository {
  Future<Either<Failure, void>> addCustomer(Customer customer);

  Future<Either<Failure, void>> updateCustomer(Customer customer);

  Future<Either<Failure, void>> deleteCustomer(int customerId);

  Future<Either<Failure, List<Customer>>> getAllCustomers();
}
