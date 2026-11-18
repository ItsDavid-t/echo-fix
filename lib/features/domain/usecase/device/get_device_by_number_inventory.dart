import 'package:echo_fix/core/error/failure.dart';
import 'package:echo_fix/features/domain/entities/device.dart';
import 'package:echo_fix/features/domain/repositories/device_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetDeviceByNumberInventory {
  final DeviceRepository repository;

  const GetDeviceByNumberInventory(this.repository);

  Future<Either<Failure, Device?>> call(String deviceNumberID) async {
    return await repository.getDeviceByNumberInventory(deviceNumberID);
  }
}
