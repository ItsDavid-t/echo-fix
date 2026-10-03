import 'package:echo_fix/features/data/models/device_model.dart';
import 'package:echo_fix/features/domain/entities/device.dart';
import 'package:echo_fix/features/domain/repositories/device_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DeviceRepositoryImpl implements DeviceRepository {
  final SupabaseClient supabase;
  DeviceRepositoryImpl({required this.supabase});

  @override
  Future<void> addDevice(Device device) async {
    try {
      await supabase.from('device').insert({
        'customer_id': device.customerId,
        'name': device.deviceName,
        'type': device.deviceType,
        'inventory_number': device.deviceNumberID,
        'image_url': device.deviceImage,
        'created_at': device.createdAt,
      });
    } catch (e) {
      throw Exception('Error al agregar el dispositivo: $e');
    }
  }

  @override
  Future<void> deleteDevice(int deviceId) async {
    try {
      await supabase.from('device').delete().eq('device_id', deviceId);
    } catch (e) {
      throw Exception('Error al eliminar el dispositivo: $e');
    }
  }

  @override
  Future<List<Device>> getAllDevices() async {
    try {
      final response = await supabase.from('device').select();
      return response.map((json) => DeviceModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Error al obtener los dispositivos: $e');
    }
  }

  @override
  Future<Device?> getDeviceByNumberInventary(String deviceNumberID) async {
    try {
      final response = await supabase
          .from('device')
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
  Future<void> updateDevice(Device device) async {
    try {
      await supabase
          .from('device')
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
