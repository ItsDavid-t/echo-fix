import 'package:echo_fix/features/domain/entities/device.dart';
import 'package:echo_fix/features/domain/repositories/device_repository.dart';

class AddDevice {
  final DeviceRepository repository;
  AddDevice(this.repository);

  Future<void> call(Device device) async {
    return await repository.addDevice(device);
  }
}
