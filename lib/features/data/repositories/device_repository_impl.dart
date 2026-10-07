import 'package:echo_fix/core/error/failure.dart';
import 'package:echo_fix/features/data/datasources/device_remote_data_source_impl.dart';
import 'package:echo_fix/features/data/models/device_model.dart';
import 'package:echo_fix/features/domain/entities/device.dart';
import 'package:echo_fix/features/domain/repositories/device_repository.dart';
import 'package:fpdart/fpdart.dart';

class DeviceRepositoryImpl implements DeviceRepository {
  final DeviceRemoteDataSourceImpl remoteDataSource;
  DeviceRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, void>> addDevice(Device device) async {
    try {
      final deviceModel = DeviceModel.fromEntity(device);
      await remoteDataSource.addDevice(deviceModel);
      return Right(null);
    } catch (e) {
      return Left(ServerFailure('Error al agregar el dispositivo: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteDevice(int deviceId) async {
    try {
      return remoteDataSource
          .deleteDevice(deviceId)
          .then((_) => const Right(null));
    } catch (e) {
      return Left(ServerFailure('Error al eliminar el dispositivo: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Device>>> getAllDevices() async {
    try {
      final deviceModels = await remoteDataSource.getAllDevices();
      final devices = deviceModels.map((model) => model.toEntity()).toList();
      return Right(devices);
    } catch (e) {
      return Left(ServerFailure('Error al obtener los dispositivos: $e'));
    }
  }

  @override
  Future<Either<Failure, Device?>> getDeviceByNumberInventory(
    String deviceNumberID,
  ) async {
    try {
      final deviceModel = await remoteDataSource.getDeviceByNumberInventory(
        deviceNumberID,
      );
      return Right(deviceModel?.toEntity());
    } catch (e) {
      return Left(ServerFailure('Error al obtener el dispositivo: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateDevice(Device device) async {
    try {
      final deviceModel = DeviceModel.fromEntity(device);
      await remoteDataSource.updateDevice(deviceModel);
      return Right(null);
    } catch (e) {
      return Left(ServerFailure('Error al actualizar el dispositivo: $e'));
    }
  }
}
