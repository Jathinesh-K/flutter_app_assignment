import 'package:device_sensor_info_app/domain/repositories/device_info_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../../utils/result.dart';

class DeviceBatteryViewModel extends ChangeNotifier {
  final DeviceInfoRepository _repository;

  DeviceBatteryViewModel({required DeviceInfoRepository deviceInfoRepository})
    : _repository = deviceInfoRepository;
  
  String _batteryLevel = 'Click to get battery level';
  String get batteryLevel => _batteryLevel;

  Future<void> getBatteryLevel() async {
    final result = await _repository.getBatteryLevel();

    switch (result) {
      case Ok():
      _batteryLevel = 'Battery Level: ${result.value}';
      case Error():
      _batteryLevel = 'Failed to get battery level: ${result.error}';
    }
    notifyListeners();
  }
}
