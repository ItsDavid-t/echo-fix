import 'package:echo_fix/core/error/failure.dart';
import 'package:echo_fix/features/domain/entities/repair_device.dart';
import 'package:fpdart/fpdart.dart';

abstract class RepairDeviceRepository {
  Future<Either<Failure, void>> addRepairDevice(RepairDevice repairDevice);
  Future<Either<Failure, void>> updateRepairDevice(RepairDevice repairDevice);
  Future<Either<Failure, void>> deleteRepairDevice(int repairId);
  Future<Either<Failure, List<RepairDevice>>> getAllRepairDevices();
  Future<Either<Failure, List<RepairDevice>>> getRepairsByUser(int userId);
}
