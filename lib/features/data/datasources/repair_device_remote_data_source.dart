import 'package:echo_fix/features/data/models/repair_device_model.dart';

abstract class RepairDeviceRemoteDataSource {
  Future<void> addRepairDevice(RepairDeviceModel repairDevice);
  Future<void> updateRepairDevice(RepairDeviceModel repairDevice);
  Future<void> deleteRepairDevice(int repairId);
  Future<List<RepairDeviceModel>> getAllRepairDevices();
  Future<List<RepairDeviceModel>> getRepairsByUser(int userId);
}
