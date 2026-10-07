import 'package:echo_fix/core/error/failure.dart';
import 'package:echo_fix/features/domain/repositories/repair_device_repository.dart';
import 'package:fpdart/fpdart.dart';

class DeleteRepairDevice {
  final RepairDeviceRepository repository;

  const DeleteRepairDevice(this.repository);

  Future<Either<Failure, void>> call(int repairId) async {
    return await repository.deleteRepairDevice(repairId);
  }
}
