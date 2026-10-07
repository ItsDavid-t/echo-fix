import 'package:echo_fix/core/error/failure.dart';
import 'package:echo_fix/features/domain/entities/device.dart';
import 'package:echo_fix/features/domain/repositories/device_repository.dart';
import 'package:fpdart/fpdart.dart';

class Updatedevice {
  final DeviceRepository repository;
  const Updatedevice(this.repository);

  Future<Either<Failure, void>> call(Device device) async {
    return await repository.updateDevice(device);
  }
}
