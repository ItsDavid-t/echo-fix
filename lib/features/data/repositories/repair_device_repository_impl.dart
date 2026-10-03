import 'package:echo_fix/features/data/models/repair_device_model.dart';
import 'package:echo_fix/features/domain/entities/repair_device.dart';
import 'package:echo_fix/features/domain/repositories/repair_device_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RepairDeviceRepositoryImpl implements RepairDeviceRepository {
  final SupabaseClient supabase;

  RepairDeviceRepositoryImpl({required this.supabase});

  @override
  Future<void> addRepairDevice(RepairDevice repairDevice) async {
    try {
      await supabase.from('repair').insert({
        'device_id': repairDevice.deviceId,
        'responsable_id': repairDevice.userId,
        'customer_id': repairDevice.customerId,
        'status': repairDevice.repairStatus,
        'created_at': repairDevice.repairDate.toIso8601String(),
        'completed_at': repairDevice.repairCompletionDate?.toIso8601String(),
        'problem_description': repairDevice.repairDescription,
      });
    } catch (e) {
      throw Exception('Error al agregar la reparación: $e');
    }
  }

  @override
  Future<void> deleteRepairDevice(int repairId) async {
    try {
      await supabase.from('repair').delete().eq('repair_id', repairId);
    } catch (e) {
      throw Exception('Error al eliminar la reparación: $e');
    }
  }

  @override
  Future<List<RepairDevice>> getAllRepairDevices() async {
    try {
      final response = await supabase.from('repair_participants').select();

      return response.map<RepairDevice>((repairs) {
        return RepairDeviceModel(
          repairId: repairs['repair_id'],
          deviceId: repairs['device_id'],
          userId: repairs['user_id'],
          customerId: repairs['customer_id'],
          repairStatus: repairs['status'],
          repairDate: DateTime.parse(repairs['created_at']),
          repairCompletionDate: repairs['completed_at'] != null
              ? DateTime.parse(repairs['completed_at'])
              : null,
          repairDescription: repairs['description'],
        );
      }).toList();
    } catch (e) {
      throw Exception('Error al obtener las reparaciones: $e');
    }
  }

  @override
  Future<void> updateRepairDevice(RepairDevice repairDevice) async {
    try {
      await supabase
          .from('repair')
          .update({
            'device_id': repairDevice.deviceId,
            'responsable_id': repairDevice.userId,
            'customer_id': repairDevice.customerId,
            'status': repairDevice.repairStatus,
            'completed_at': repairDevice.repairCompletionDate
                ?.toIso8601String(),
            'problem_description': repairDevice.repairDescription,
          })
          .eq('repair_id', repairDevice.repairId);
    } catch (e) {
      throw Exception('Error al actualizar la reparación: $e');
    }
  }

  @override
  Future<List<RepairDevice>> getRepairsByUser(int userId) async {
    try {
      final response = await supabase
          .from('repair_participants')
          .select()
          .eq('user_id', userId);

      return response.map<RepairDevice>((repairs) {
        return RepairDeviceModel(
          repairId: repairs['repair_id'],
          deviceId: repairs['device_id'],
          userId: repairs['user_id'],
          customerId: repairs['customer_id'],
          repairStatus: repairs['status'],
          repairDate: DateTime.parse(repairs['created_at']),
          repairCompletionDate: repairs['completed_at'] != null
              ? DateTime.parse(repairs['completed_at'])
              : null,
          repairDescription: repairs['description'],
        );
      }).toList();
    } catch (e) {
      throw Exception('Error al obtener las reparaciones del usuario: $e');
    }
  }
}
