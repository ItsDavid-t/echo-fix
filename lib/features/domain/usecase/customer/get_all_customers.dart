import 'package:echo_fix/core/error/failure.dart';
import 'package:echo_fix/features/domain/entities/customer.dart';
import 'package:echo_fix/features/domain/repositories/customer_repositry.dart';
import 'package:fpdart/fpdart.dart';

class GetAllCustomers {
  final CustomerRepository repository;

  const GetAllCustomers(this.repository);

  Future<Either<Failure, List<Customer>>> call() async {
    return await repository.getAllCustomers();
  }
}
