import 'package:echo_fix/core/error/failure.dart';
import 'package:echo_fix/features/domain/entities/customer.dart';
import 'package:echo_fix/features/domain/repositories/customer_repositry.dart';
import 'package:fpdart/fpdart.dart';

class AddCustomer {
  final CustomerRepository repository;

  const AddCustomer(this.repository);

  Future<Either<Failure, void>> call(Customer customer) async {
    return await repository.addCustomer(customer);
  }
}
