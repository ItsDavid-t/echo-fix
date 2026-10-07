import 'package:echo_fix/features/data/datasources/repair_device_remote_data_source.dart';
import 'package:echo_fix/features/data/models/repair_device_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RepairDeviceRemoteDataSourceImpl implements RepairDeviceRemoteDataSource {
  final SupabaseClient supabase;
  final String repairTable = 'repair';
  final String repairParticipantTable = 'repair_participants';
  RepairDeviceRemoteDataSourceImpl({required this.supabase});

  @override
  Future<void> addRepairDevice(RepairDeviceModel repairDevice) async {
    try {
      await supabase.from(repairTable).insert(repairDevice.toJson());
    } catch (e) {
      throw Exception('Error al agregar la reparación: $e');
    }
  }

  @override
  Future<void> deleteRepairDevice(int repairId) async {
    try {
      await supabase.from(repairTable).delete().eq('repair_id', repairId);
    } catch (e) {
      throw Exception('Error al eliminar la reparación: $e');
    }
  }

  @override
  Future<List<RepairDeviceModel>> getAllRepairDevices() async {
    try {
      final response = await supabase.from(repairParticipantTable).select();

      return response.map<RepairDeviceModel>((repairs) {
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
  Future<void> updateRepairDevice(RepairDeviceModel repairDevice) async {
    try {
      await supabase
          .from(repairTable)
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
  Future<List<RepairDeviceModel>> getRepairsByUser(int userId) async {
    try {
      final response = await supabase
          .from(repairParticipantTable)
          .select()
          .eq('user_id', userId);

      return response.map<RepairDeviceModel>((repairs) {
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
