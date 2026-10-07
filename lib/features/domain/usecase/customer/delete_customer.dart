import 'package:echo_fix/core/error/failure.dart';
import 'package:echo_fix/features/domain/repositories/customer_repositry.dart';
import 'package:fpdart/fpdart.dart';

class DeleteCustomer {
  final CustomerRepository repository;

  const DeleteCustomer(this.repository);

  Future<Either<Failure, void>> call(int customerId) async {
    return await repository.deleteCustomer(customerId);
  }
}
