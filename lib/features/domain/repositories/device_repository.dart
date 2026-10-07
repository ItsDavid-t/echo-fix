import 'package:echo_fix/core/error/failure.dart';
import 'package:echo_fix/features/domain/entities/device.dart';
import 'package:fpdart/fpdart.dart';

abstract class DeviceRepository {
  Future<Either<Failure, void>> addDevice(Device device);
  Future<Either<Failure, void>> updateDevice(Device device);
  Future<Either<Failure, void>> deleteDevice(int deviceId);
  Future<Either<Failure, List<Device>>> getAllDevices();
  Future<Either<Failure, Device?>> getDeviceByNumberInventory(
    String deviceNumberID,
  );
}
