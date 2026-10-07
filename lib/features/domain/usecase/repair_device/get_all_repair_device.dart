import 'package:echo_fix/core/error/failure.dart';
import 'package:echo_fix/features/domain/entities/repair_device.dart';
import 'package:echo_fix/features/domain/repositories/repair_device_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllRepairDevice {
  final RepairDeviceRepository repository;

  const GetAllRepairDevice(this.repository);

  Future<Either<Failure, List<RepairDevice>>> call() async {
    return await repository.getAllRepairDevices();
  }
}
