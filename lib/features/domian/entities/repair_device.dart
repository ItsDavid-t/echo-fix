class RepairDevice {
  final int repairId;
  final int deviceId;
  final int customerId;
  final int userId;
  final String repairStatus;
  final String repairDescription;
  final DateTime repairDate;
  final DateTime? repairCompletionDate;

  RepairDevice({
    required this.repairId,
    required this.deviceId,
    required this.customerId,
    required this.repairStatus,
    required this.repairDescription,
    required this.repairDate,
    required this.userId,
    this.repairCompletionDate,
  });
}
