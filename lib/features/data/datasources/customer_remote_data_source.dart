import 'package:echo_fix/features/data/models/customer_model.dart';

abstract class CustomerRemoteDataSource {
  Future<void> addCustomer(CustomerModel customer);
  Future<void> updateCustomer(CustomerModel customer);
  Future<void> deleteCustomer(int customerId);
  Future<List<CustomerModel>> getAllCustomers();
}
