import 'package:echo_fix/features/domain/entities/repair_device.dart';

class RepairDeviceModel extends RepairDevice {
  RepairDeviceModel({
    required super.repairId,
    required super.deviceId,
    required super.customerId,
    required super.userId,
    required super.repairStatus,
    required super.repairDescription,
    required super.repairDate,
    required super.repairCompletionDate,
  });

  factory RepairDeviceModel.fromJson(Map<String, dynamic> json) {
    return RepairDeviceModel(
      repairId: json['id'] as int,
      deviceId: json['device_id'] as int,
      customerId: json['customer_id'] as int,
      userId: json['responsable_id'] as int,
      repairStatus: json['status'] as String,
      repairDescription: json['problem_description'] as String,
      repairDate: DateTime.parse(json['created_at'] as String),
      repairCompletionDate: json['completed_at'] != null
          ? DateTime.parse(json['completed_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': repairId,
      'device_id': deviceId,
      'customer_id': customerId,
      'responsable_id': userId,
      'status': repairStatus,
      'problem_description': repairDescription,
      'created_at': repairDate.toIso8601String(),
      'completed_at': repairCompletionDate?.toIso8601String(),
    };
  }

  factory RepairDeviceModel.fromEntity(RepairDevice repairDevice) {
    return RepairDeviceModel(
      repairId: repairDevice.repairId,
      deviceId: repairDevice.deviceId,
      customerId: repairDevice.customerId,
      userId: repairDevice.userId,
      repairStatus: repairDevice.repairStatus,
      repairDescription: repairDevice.repairDescription,
      repairDate: repairDevice.repairDate,
      repairCompletionDate: repairDevice.repairCompletionDate,
    );
  }

  RepairDevice toEntity() {
    return RepairDevice(
      repairId: repairId,
      deviceId: deviceId,
      customerId: customerId,
      userId: userId,
      repairStatus: repairStatus,
      repairDescription: repairDescription,
      repairDate: repairDate,
      repairCompletionDate: repairCompletionDate,
    );
  }
}
