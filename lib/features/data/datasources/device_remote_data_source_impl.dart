import 'package:echo_fix/features/data/datasources/device_remote_data_source.dart';
import 'package:echo_fix/features/data/models/device_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DeviceRemoteDataSourceImpl extends DeviceRemoteDataSource {
  final SupabaseClient supabase;
  final String deviceTable = 'device';
  DeviceRemoteDataSourceImpl({required this.supabase});

  @override
  Future<void> addDevice(DeviceModel device) async {
    try {
      await supabase.from(deviceTable).insert(device.toJson());
    } catch (e) {
      throw Exception('Error al agregar el dispositivo: $e');
    }
  }

  @override
  Future<void> deleteDevice(int deviceId) async {
    try {
      await supabase.from(deviceTable).delete().eq('device_id', deviceId);
    } catch (e) {
      throw Exception('Error al eliminar el dispositivo: $e');
    }
  }

  @override
  Future<List<DeviceModel>> getAllDevices() async {
    try {
      final response = await supabase.from(deviceTable).select();
      return response.map((json) => DeviceModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Error al obtener los dispositivos: $e');
    }
  }

  @override
  Future<DeviceModel?> getDeviceByNumberInventory(String deviceNumberID) async {
    try {
      final response = await supabase
          .from(deviceTable)
          .select()
          .eq('inventory_number', deviceNumberID)
          .maybeSingle();
      if (response == null) {
        return null;
      }

      return DeviceModel.fromJson(response);
    } catch (e) {
      throw Exception('Error al obtener el dispositivo por ID: $e');
    }
  }

  @override
  Future<void> updateDevice(DeviceModel device) async {
    try {
      await supabase
          .from(deviceTable)
          .update({
            'customer_id': device.customerId,
            'name': device.deviceName,
            'type': device.deviceType,
            'inventory_number': device.deviceNumberID,
            'image_url': device.deviceImage,
          })
          .eq('device_id', device.deviceId);
    } catch (e) {
      throw Exception('Error al actualizar el dispositivo: $e');
    }
  }
}
