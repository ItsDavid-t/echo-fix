import 'package:echo_fix/core/error/failure.dart';
import 'package:echo_fix/features/domain/entities/device.dart';
import 'package:echo_fix/features/domain/repositories/device_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllDevices {
  final DeviceRepository repository;

  const GetAllDevices(this.repository);

  Future<Either<Failure, List<Device>>> call() async {
    return await repository.getAllDevices();
  }
}
