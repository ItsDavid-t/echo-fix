import 'package:echo_fix/features/domian/entities/repair_device.dart';

class RepairDeviceModel {
  final int repairId;
  final int deviceId;
  final int customerId;
  final int userId;
  final String repairStatus;
  final String repairDescription;
  final DateTime repairDate;
  final DateTime? repairCompletionDate;

  RepairDeviceModel({
    required this.repairId,
    required this.deviceId,
    required this.customerId,
    required this.userId,
    required this.repairStatus,
    required this.repairDescription,
    required this.repairDate,
    this.repairCompletionDate,
  });

  RepairDeviceModel.fromJson(Map<String, dynamic> json)
    : repairId = json['repairId'] as int,
      deviceId = json['deviceId'] as int,
      customerId = json['customerId'] as int,
      userId = json['userId'] as int,
      repairStatus = json['repairStatus'] as String,
      repairDescription = json['repairDescription'] as String,
      repairDate = DateTime.parse(json['repairDate'] as String),
      repairCompletionDate = json['repairCompletionDate'] != null
          ? DateTime.parse(json['repairCompletionDate'] as String)
          : null;

  Map<String, dynamic> toJson() {
    return {
      'repairId': repairId,
      'deviceId': deviceId,
      'customerId': customerId,
      'userId': userId,
      'repairStatus': repairStatus,
      'repairDescription': repairDescription,
      'repairDate': repairDate.toIso8601String(),
      'repairCompletionDate': repairCompletionDate?.toIso8601String(),
    };
  }

  RepairDeviceModel.fromEntity(RepairDevice repairDevice)
    : repairId = repairDevice.repairId,
      deviceId = repairDevice.deviceId,
      customerId = repairDevice.customerId,
      userId = repairDevice.userId,
      repairStatus = repairDevice.repairStatus,
      repairDescription = repairDevice.repairDescription,
      repairDate = repairDevice.repairDate,
      repairCompletionDate = repairDevice.repairCompletionDate;

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
