import 'package:echo_fix/features/domain/entities/customer.dart';

abstract class CustomerRepository {
  Future<void> addCustomer(Customer customer);
  Future<void> updateCustomer(Customer customer);
  Future<void> deleteCustomer(int customerId);
  Future<List<Customer>> getAllCustomers();
}
