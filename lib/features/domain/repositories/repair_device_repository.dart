import 'package:echo_fix/features/domain/entities/repair_device.dart';

abstract class RepairDeviceRepository {
  Future<void> addRepairDevice(RepairDevice repairDevice);
  Future<void> updateRepairDevice(RepairDevice repairDevice);
  Future<void> deleteRepairDevice(int repairId);
  Future<List<RepairDevice>> getAllRepairDevices();
  Future<List<RepairDevice>> getRepairsByUser(int userId);
}
