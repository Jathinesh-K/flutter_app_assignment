import 'package:flutter/services.dart';

abstract class FlashlightService {
  Future<bool> hasFlashlight();
  Future<bool> toggleFlashlight(bool enable);
}

class FlashlightServiceImpl implements FlashlightService {
  static const _channel = MethodChannel('device/sensor');

  @override
  Future<bool> hasFlashlight() async {
    try {
      final result = await _channel.invokeMethod<bool>('hasFlashlight');
      return result ?? false;
    } on PlatformException {
      throw Exception('Flashlight availability unknown');
    }
  }

  @override
  Future<bool> toggleFlashlight(bool enable) async {
    try {
      final result = await _channel.invokeMethod<bool>('toggleFlashlight', {
        'enable': enable,
      });
      return result ?? false;
    } on PlatformException {
      throw Exception('Unable to toggle Flashlight');
    }
  }
}
