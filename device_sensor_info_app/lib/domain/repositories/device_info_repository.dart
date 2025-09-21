import 'package:device_sensor_info_app/utils/result.dart';

abstract class DeviceInfoRepository {
  Future<Result<int>> getBatteryLevel();
}