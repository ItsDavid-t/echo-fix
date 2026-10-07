import 'package:echo_fix/core/error/failure.dart';
import 'package:echo_fix/features/domain/repositories/device_repository.dart';
import 'package:fpdart/fpdart.dart';

class DeleteDevice {
  final DeviceRepository repository;

  const DeleteDevice(this.repository);

  Future<Either<Failure, void>> call(int deviceId) async {
    return await repository.deleteDevice(deviceId);
  }
}
