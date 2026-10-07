import 'package:echo_fix/core/error/failure.dart';
import 'package:echo_fix/features/domain/entities/repair_device.dart';
import 'package:echo_fix/features/domain/repositories/repair_device_repository.dart';
import 'package:fpdart/fpdart.dart';

class UpdateRepairDevice {
  final RepairDeviceRepository repository;

  const UpdateRepairDevice(this.repository);

  Future<Either<Failure, void>> call(RepairDevice repairDevice) async {
    return await repository.updateRepairDevice(repairDevice);
  }
}
