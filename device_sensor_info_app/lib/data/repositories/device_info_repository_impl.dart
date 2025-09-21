import 'package:device_sensor_info_app/data/services/device_info_service.dart';
import 'package:device_sensor_info_app/domain/models/device_info.dart';
import 'package:device_sensor_info_app/domain/repositories/device_info_repository.dart';
import 'package:device_sensor_info_app/utils/result.dart';

class DeviceInfoRepositoryImpl implements DeviceInfoRepository {
  final DeviceInfoService _service;

  DeviceInfoRepositoryImpl(this._service);

  @override
  Future<Result<DeviceInfo>> getDeviceInfo() async {
    final nameResult = await getDeviceName();
    if (nameResult is Error<String>) return Result.error(nameResult.error);
    final osResult = await getOSVersion();
    if (osResult is Error<String>) return Result.error(osResult.error);
    final batteryResult = await getBatteryLevel();
    if (batteryResult is Error<int?>) return Result.error(batteryResult.error);

    return Result.ok(
      DeviceInfo(
        deviceName: (nameResult as Ok<String>).value,
        osVersion: (osResult as Ok<String>).value,
        batteryLevel: (batteryResult as Ok<int?>).value,
      ),
    );
  }

  Future<Result<int?>> getBatteryLevel() async {
    try {
      final level = await _service.getBatteryLevel();
      return Result.ok(level);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<String>> getDeviceName() async {
    try {
      final deviceName = await _service.getDeviceName();
      return Result.ok(deviceName);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<String>> getOSVersion() async {
    try {
      final osVersion = await _service.getOSVersion();
      return Result.ok(osVersion);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
