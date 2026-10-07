import 'package:echo_fix/features/domain/entities/repair_device.dart';
import 'package:echo_fix/features/domain/repositories/repair_device_repository.dart';

class AddRepairDevice {
  final RepairDeviceRepository repository;
  const AddRepairDevice(this.repository);

  Future<void> call(RepairDevice repairDevice) async {
    return await repository.addRepairDevice(repairDevice);
  }
}
