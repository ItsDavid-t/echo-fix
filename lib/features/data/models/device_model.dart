import 'package:echo_fix/features/domain/entities/device.dart';

class DeviceModel extends Device {
  DeviceModel({
    required super.customerId,
    required super.deviceId,
    required super.deviceName,
    required super.deviceType,
    required super.deviceStatus,
    required super.deviceImage,
    required super.deviceNumberID,
    required super.createdAt,
  });

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
      customerId: json['customer_id'],
      deviceId: json['device_id'],
      deviceName: json['name'],
      deviceType: json['type'],
      deviceStatus: json['status'],
      deviceImage: json['image_url'],
      deviceNumberID: json['inventory_number'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'device_id': deviceId,
      'customer_id': customerId,
      'name': deviceName,
      'type': deviceType,
      'status': deviceStatus,
      'image_url': deviceImage,
      'inventory_number': deviceNumberID,
      'created_at': createdAt,
    };
  }

  factory DeviceModel.fromEntity(Device device) {
    return DeviceModel(
      customerId: device.customerId,
      deviceId: device.deviceId,
      deviceName: device.deviceName,
      deviceType: device.deviceType,
      deviceStatus: device.deviceStatus,
      deviceImage: device.deviceImage,
      deviceNumberID: device.deviceNumberID,
      createdAt: device.createdAt,
    );
  }

  Device toEntity() {
    return Device(
      deviceId: deviceId,
      customerId: customerId,
      deviceName: deviceName,
      deviceType: deviceType,
      deviceStatus: deviceStatus,
      deviceImage: deviceImage,
      deviceNumberID: deviceNumberID,
      createdAt: createdAt,
    );
  }
}
