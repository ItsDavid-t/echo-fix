import 'package:echo_fix/features/data/datasources/customer_remote_data_source.dart';
import 'package:echo_fix/features/data/models/customer_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomerRemoteDataSourceImpl implements CustomerRemoteDataSource {
  final SupabaseClient supabase;
  final String customerTable = 'customer';

  CustomerRemoteDataSourceImpl({required this.supabase});

  @override
  Future<void> addCustomer(CustomerModel customer) async {
    try {
      await supabase.from(customerTable).insert(customer.toJson());
    } catch (e) {
      throw Exception('Error al agregar el cliente: $e');
    }
  }

  @override
  Future<void> deleteCustomer(int customerId) async {
    try {
      await supabase.from(customerTable).delete().eq('customer_id', customerId);
    } catch (e) {
      throw Exception('Error al eliminar el cliente: $e');
    }
  }

  @override
  Future<List<CustomerModel>> getAllCustomers() async {
    try {
      final response = await supabase.from(customerTable).select();
      return response.map((json) => CustomerModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Error al obtener los clientes: $e');
    }
  }

  @override
  Future<void> updateCustomer(CustomerModel customer) async {
    try {
      await supabase
          .from(customerTable)
          .update({
            'name': customer.customerName,
            'email': customer.customerEmail,
            'city': customer.customerCity,
            'workplace': customer.customerWorkplace,
          })
          .eq('customer_id', customer.customerId);
    } catch (e) {
      throw Exception('Error al actualizar el cliente: $e');
    }
  }
}
