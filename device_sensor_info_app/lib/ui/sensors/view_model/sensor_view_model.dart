import 'package:device_sensor_info_app/domain/repositories/sensory_repository.dart';
import 'package:flutter/material.dart';

import '../../../utils/result.dart';

class SensorViewModel extends ChangeNotifier {
  final SensorRepository _repository;

  SensorViewModel({required SensorRepository sensorRepository})
    : _repository = sensorRepository {
    _init();
  }
  bool _hasFlashlight = false;
  bool get hasFlashlight => _hasFlashlight;

  bool _flashlightEnabled = false;
  bool get flashlightEnabled => _flashlightEnabled;

  bool _isFlashlightLoading = false;
  bool get isFlashlightLoading => _isFlashlightLoading;

  Future<void> _init() async {
    final hasFlashlightResult = await _repository.hasFlashlight();
    if (hasFlashlightResult is Ok<bool>) {
      _hasFlashlight = hasFlashlightResult.value;
    }
    notifyListeners();
  }

  Future<void> toggleFlashlight() async {
    if (!hasFlashlight) return;
    _isFlashlightLoading = true;
    notifyListeners();

    final result = await _repository.toggleFlashlight(!flashlightEnabled);
    if (result is Ok<bool> && result.value) {
      _flashlightEnabled = !_flashlightEnabled;
    }
    _isFlashlightLoading = false;
    notifyListeners();
  }
}
