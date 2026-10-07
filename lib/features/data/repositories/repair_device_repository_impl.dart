import 'package:echo_fix/core/error/failure.dart';
import 'package:echo_fix/features/data/datasources/repair_device_remote_data_source_impl.dart';
import 'package:echo_fix/features/data/models/repair_device_model.dart';
import 'package:echo_fix/features/domain/entities/repair_device.dart';
import 'package:echo_fix/features/domain/repositories/repair_device_repository.dart';
import 'package:fpdart/fpdart.dart';

class RepairDeviceRepositoryImpl implements RepairDeviceRepository {
  final RepairDeviceRemoteDataSourceImpl remoteDataSource;

  RepairDeviceRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, void>> addRepairDevice(
    RepairDevice repairDevice,
  ) async {
    try {
      final repairDeviceModel = RepairDeviceModel.fromEntity(repairDevice);
      await remoteDataSource.addRepairDevice(repairDeviceModel);
      return Right(null);
    } catch (e) {
      return Left(
        ServerFailure('Error al agregar la reparacion del dispositivo '),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteRepairDevice(int repairId) async {
    try {
      return await remoteDataSource
          .deleteRepairDevice(repairId)
          .then((_) => Right(null));
    } catch (e) {
      return Left(
        ServerFailure('Error al eliminar la reparacion del dispositivo $e'),
      );
    }
  }

  @override
  Future<Either<Failure, List<RepairDevice>>> getAllRepairDevices() async {
    try {
      return await remoteDataSource.getAllRepairDevices().then((repairModels) {
        final repairDevice = repairModels
            .map((model) => model.toEntity())
            .toList();
        return Right(repairDevice);
      });
    } catch (e) {
      return Left(
        ServerFailure('Error al obtener las reparaciones de los dispositivos'),
      );
    }
  }

  @override
  Future<Either<Failure, List<RepairDevice>>> getRepairsByUser(
    int userId,
  ) async {
    try {
      return await remoteDataSource.getRepairsByUser(userId).then((
        repairModels,
      ) {
        final repairDevice = repairModels
            .map((model) => model.toEntity())
            .toList();
        return Right(repairDevice);
      });
    } catch (e) {
      return Left(
        ServerFailure(
          'Error al obtener la repacaciones de los dispositivos por usuario',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> updateRepairDevice(
    RepairDevice repairDevice,
  ) async {
    try {
      final repairDeviceModel = RepairDeviceModel.fromEntity(repairDevice);
      await remoteDataSource.updateRepairDevice(repairDeviceModel);
      return Right(null);
    } catch (e) {
      return Left(
        ServerFailure('Error al actualizar la reparacion del dispositivo '),
      );
    }
  }
}
