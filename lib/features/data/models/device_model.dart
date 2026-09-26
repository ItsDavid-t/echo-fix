import 'package:echo_fix/features/domian/entities/device.dart';

class DeviceModel {
  final int deviceId;
  final String deviceName;
  final String deviceType;
  final String deviceStatus;
  final String deviceProblem;
  final String deviceImage;
  final String deviceNumberID;

  DeviceModel({
    required this.deviceId,
    required this.deviceName,
    required this.deviceType,
    required this.deviceStatus,
    required this.deviceProblem,
    required this.deviceImage,
    required this.deviceNumberID,
  });

  DeviceModel.fromJson(Map<String, dynamic> json)
    : deviceId = json['deviceId'] as int,
      deviceName = json['deviceName'] as String,
      deviceType = json['deviceType'] as String,
      deviceStatus = json['deviceStatus'] as String,
      deviceProblem = json['deviceProblem'] as String,
      deviceImage = json['deviceImage'] as String,
      deviceNumberID = json['deviceNumberID'] as String;

  Map<String, dynamic> toJson() {
    return {
      'deviceId': deviceId,
      'deviceName': deviceName,
      'deviceType': deviceType,
      'deviceStatus': deviceStatus,
      'deviceProblem': deviceProblem,
      'deviceImage': deviceImage,
      'deviceNumberID': deviceNumberID,
    };
  }

  DeviceModel.fromEntity(Device device)
    : deviceId = device.deviceId,
      deviceName = device.deviceName,
      deviceType = device.deviceType,
      deviceStatus = device.deviceStatus,
      deviceProblem = device.deviceProblem,
      deviceImage = device.deviceImage,
      deviceNumberID = device.deviceNumberID;

  Device toEntity() {
    return Device(
      deviceId: deviceId,
      deviceName: deviceName,
      deviceType: deviceType,
      deviceStatus: deviceStatus,
      deviceProblem: deviceProblem,
      deviceImage: deviceImage,
      deviceNumberID: deviceNumberID,
    );
  }
}
