import 'package:device_sensor_info_app/domain/models/device_info.dart';
import 'package:device_sensor_info_app/utils/result.dart';

abstract class DeviceInfoRepository {
  Future<Result<DeviceInfo>> getDeviceInfo();
}