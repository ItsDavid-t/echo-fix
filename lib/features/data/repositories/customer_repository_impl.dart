import 'package:echo_fix/features/data/models/customer_model.dart';
import 'package:echo_fix/features/domain/entities/customer.dart';
import 'package:echo_fix/features/domain/repositories/customer_repositry.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final SupabaseClient supabase;
  CustomerRepositoryImpl({required this.supabase});

  @override
  Future<void> addCustomer(Customer customer) async {
    try {
      await supabase.from('customer').insert({
        'name': customer.customerName,
        'email': customer.customerEmail,
        'city': customer.customerCity,
        'workplace': customer.customerWorkplace,
        'created_at': customer.customerCreatedAt,
      });
    } catch (e) {
      throw Exception('Error al agregar el cliente: $e');
    }
  }

  @override
  Future<void> deleteCustomer(int customerId) async {
    try {
      await supabase.from('customer').delete().eq('customer_id', customerId);
    } catch (e) {
      throw Exception('Error al eliminar el cliente: $e');
    }
  }

  @override
  Future<List<Customer>> getAllCustomers() async {
    try {
      final response = await supabase.from('customer').select();
      return response.map((json) => CustomerModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Error al obtener los clientes: $e');
    }
  }

  @override
  Future<void> updateCustomer(Customer customer) {
    try {
      return supabase
          .from('customer')
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
