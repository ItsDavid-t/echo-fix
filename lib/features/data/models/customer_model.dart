import 'package:echo_fix/features/domain/entities/customer.dart';

class CustomerModel extends Customer {
  CustomerModel({
    required super.customerId,
    required super.customerName,
    required super.customerEmail,
    required super.customerCity,
    required super.customerWorkplace,
    required super.customerCreatedAt,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      customerId: json['id'] as int,
      customerName: json['name'] as String,
      customerCity: json['city'] as String,
      customerWorkplace: json['workplace'] as String,
      customerEmail: json['email'] as String,
      customerCreatedAt: json['createdAt'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': customerId,
      'name': customerName,
      'city': customerCity,
      'workplace': customerWorkplace,
      'email': customerEmail,
      'createdAt': customerCreatedAt,
    };
  }

  factory CustomerModel.fromEntity(Customer customer) {
    return CustomerModel(
      customerId: customer.customerId,
      customerName: customer.customerName,
      customerCity: customer.customerCity,
      customerWorkplace: customer.customerWorkplace,
      customerEmail: customer.customerEmail,
      customerCreatedAt: customer.customerCreatedAt,
    );
  }
  Customer toEntity() {
    return Customer(
      customerId: customerId,
      customerName: customerName,
      customerCity: customerCity,
      customerWorkplace: customerWorkplace,
      customerEmail: customerEmail,
      customerCreatedAt: customerCreatedAt,
    );
  }
}
