import 'package:echo_fix/features/data/models/device_model.dart';

abstract class DeviceRemoteDataSource {
  Future<void> addDevice(DeviceModel device);
  Future<void> updateDevice(DeviceModel device);
  Future<void> deleteDevice(int deviceId);
  Future<List<DeviceModel>> getAllDevices();
  Future<DeviceModel?> getDeviceByNumberInventory(String deviceNumberID);
}
