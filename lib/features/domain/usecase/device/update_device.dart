import 'package:echo_fix/features/domain/entities/device.dart';
import 'package:echo_fix/features/domain/repositories/device_repository.dart';

class Updatedevice {
  final DeviceRepository repository;
  Updatedevice(this.repository);

  Future<void> call(Device device) async {
    return await repository.updateDevice(device);
  }
}
