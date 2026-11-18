import 'package:echo_fix/features/domain/entities/customer.dart';
import 'package:echo_fix/features/domain/usecase/customer/add_customer.dart';
import 'package:echo_fix/features/domain/usecase/customer/delete_customer.dart';
import 'package:echo_fix/features/domain/usecase/customer/get_all_customers.dart';
import 'package:echo_fix/features/domain/usecase/customer/update_customer.dart';
import 'package:echo_fix/presentation/cubit/customer/customer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerCubit extends Cubit<CustomerState> {
  final GetAllCustomers _getAllCustomers;
  final AddCustomer _addCustomer;
  final UpdateCustomer _updateCustomer;
  final DeleteCustomer _deleteCustomer;

  CustomerCubit(
    this._getAllCustomers,
    this._addCustomer,
    this._deleteCustomer,
    this._updateCustomer,
  ) : super(CustomerInitial());

  void reset() {
    emit(CustomerInitial());
  }

  Future<void> loadCustomers() async {
    emit(CustomerLoading());

    final result = await _getAllCustomers();

    result.fold(
      (failure) {
        emit(CustomerError(failure.message));
      },
      (customers) {
        emit(CustomerLoaded(customers));
      },
    );
  }

  Future<void> addCustomer(Customer customer) async {
    final result = await _addCustomer(customer);

    result.fold(
      (failure) {
        emit(CustomerError(failure.message));
      },
      (_) {
        loadCustomers();
      },
    );
  }

  Future<void> updateCustomer(Customer customer) async {
    final result = await _updateCustomer(customer);

    return result.fold(
      (failure) {
        emit(CustomerError(failure.message));
      },
      (_) {
        loadCustomers();
      },
    );
  }

  Future<void> deleteCustomer(int idCustomer) async {
    final result = await _deleteCustomer(idCustomer);

    result.fold(
      (failure) {
        emit(CustomerError(failure.message));
      },
      (_) {
        loadCustomers();
      },
    );
  }
}
