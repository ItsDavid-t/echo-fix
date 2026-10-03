class Device {
  final int deviceId;
  final int customerId;
  final String deviceName;
  final String deviceType;
  final String deviceStatus;
  final String deviceImage;
  final String deviceNumberID;
  final String createdAt;

  Device({
    required this.customerId,
    required this.deviceId,
    required this.deviceName,
    required this.deviceType,
    required this.deviceStatus,
    required this.deviceImage,
    required this.deviceNumberID,
    required this.createdAt,
  });
}
