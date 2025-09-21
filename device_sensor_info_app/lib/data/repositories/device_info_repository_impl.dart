import 'package:device_sensor_info_app/data/services/device_info_service.dart';
import 'package:device_sensor_info_app/domain/repositories/device_info_repository.dart';
import 'package:device_sensor_info_app/utils/result.dart';

class DeviceInfoRepositoryImpl implements DeviceInfoRepository {
  final DeviceInfoService _service;

  DeviceInfoRepositoryImpl(this._service);

  @override
  Future<Result<int>> getBatteryLevel() async {
    try {
      final level = await _service.getBatteryLevel();
      if (level == null) {
        throw Exception('Battery level is null');
      }
      return Result.ok(level);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
