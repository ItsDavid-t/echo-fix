import 'package:echo_fix/features/domian/entities/device.dart';

abstract class DeviceRepository {
  Future<void> addDevice(Device device);
  Future<void> updateDevice(Device device);
  Future<void> deleteDevice(int deviceId);
  Future<List<Device>> getAllDevices();
  Future<Device?> getDeviceById(int deviceId);
}
