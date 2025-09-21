import 'package:device_sensor_info_app/data/services/flashlight_service.dart';
import 'package:device_sensor_info_app/domain/repositories/sensory_repository.dart';
import 'package:device_sensor_info_app/utils/result.dart';

class SensorRepositoryImpl implements SensorRepository {
  final FlashlightService _flashlightService;

  SensorRepositoryImpl({required FlashlightService flashlightService})
    : _flashlightService = flashlightService;

  @override
  Future<Result<bool>> hasFlashlight() async {
    try {
      return Result.ok(await _flashlightService.hasFlashlight());
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<bool>> toggleFlashlight(bool enable) async {
    try {
      return Result.ok(await _flashlightService.toggleFlashlight(enable));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
