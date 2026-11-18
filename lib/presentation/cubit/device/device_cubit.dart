import 'package:echo_fix/features/domain/entities/device.dart';
import 'package:echo_fix/features/domain/usecase/customer/get_all_customers.dart';
import 'package:echo_fix/features/domain/usecase/device/add_device.dart';
import 'package:echo_fix/features/domain/usecase/device/delete_device.dart';
import 'package:echo_fix/features/domain/usecase/device/get_device_by_number_inventory.dart';
import 'package:echo_fix/features/domain/usecase/device/update_device.dart';
import 'package:echo_fix/presentation/cubit/device/device_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceCubit extends Cubit<DeviceState> {
  final AddDevice _addDevice;
  final Updatedevice _updatedevice;
  final DeleteDevice _deleteDevice;
  final GetAllCustomers _getAllCustomers;
  final GetDeviceByNumberInventory _deviceByNumberInventory;

  DeviceCubit(
    this._addDevice,
    this._updatedevice,
    this._getAllCustomers,
    this._deviceByNumberInventory,
    this._deleteDevice,
  ) : super(ProductInitial());

  Future<void> loadDevices() async {
    emit(DeviceLoading());
    final result = await _getAllCustomers();

    result.fold(
      (failure) {
        emit(DeviceError(failure.message));
      },
      (customers) {
        emit(DeviceLoaded(customers));
      },
    );
  }

  Future<void> adDevice(Device device) async {
    final result = await _addDevice(device);

    result.fold(
      (failure) {
        emit(DeviceError(failure.message));
      },
      (_) {
        loadDevices();
      },
    );
  }

  Future<void> updateDevice(Device device) async {
    final result = await _updatedevice(device);

    result.fold(
      (failure) {
        emit(DeviceError(failure.message));
      },
      (_) {
        loadDevices();
      },
    );
  }

  Future<void> deleteDevice(int idDevice) async {
    final result = await _deleteDevice(idDevice);

    result.fold(
      (failure) {
        emit(DeviceError(failure.message));
      },
      (_) {
        loadDevices();
      },
    );
  }

  Future<void> getDeviceByNumberInventory(String number) async {
    final result = await _deviceByNumberInventory(number);

    result.fold(
      (failure) {
        emit(DeviceError(failure.message));
      },
      (devices) {
        loadDevices();
      },
    );
  }
}
