import 'package:device_sensor_info_app/utils/result.dart';

abstract class SensorRepository {
  Future<Result<bool>> hasFlashlight();
  Future<Result<bool>> toggleFlashlight(bool enable);
}