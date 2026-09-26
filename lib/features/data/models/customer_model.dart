import 'package:echo_fix/features/domian/entities/customer.dart';

class CustomerModel {
  final int customerId;
  final String customerName;
  final String customerPhone;
  final String customerLocation;

  CustomerModel({
    required this.customerId,
    required this.customerName,
    required this.customerPhone,
    required this.customerLocation,
  });

  CustomerModel.fromJson(Map<String, dynamic> json)
    : customerId = json['customerId'] as int,
      customerName = json['customerName'] as String,
      customerPhone = json['customerPhone'] as String,
      customerLocation = json['customerLocation'] as String;

  Map<String, dynamic> toJson() {
    return {
      'customerId': customerId,
      'customerName': customerName,
      'customerPhone': customerPhone,
      'customerLocation': customerLocation,
    };
  }

  CustomerModel.fromEntity(Customer customer)
    : customerId = customer.customerId,
      customerName = customer.customerName,
      customerPhone = customer.customerPhone,
      customerLocation = customer.customerLocation;

  Customer toEntity() {
    return Customer(
      customerId: customerId,
      customerName: customerName,
      customerPhone: customerPhone,
      customerLocation: customerLocation,
    );
  }
}
