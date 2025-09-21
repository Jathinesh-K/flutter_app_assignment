import 'package:device_sensor_info_app/domain/models/device_info.dart';
import 'package:device_sensor_info_app/domain/repositories/device_info_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../../utils/result.dart';

class DeviceInfoViewModel extends ChangeNotifier {
  final DeviceInfoRepository _repository;

  DeviceInfoViewModel({required DeviceInfoRepository deviceInfoRepository})
    : _repository = deviceInfoRepository;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  DeviceInfo? _deviceInfo;
  DeviceInfo? get deviceInfo => _deviceInfo;

  Future<void> getDeviceInfo() async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    final result = await _repository.getDeviceInfo();
    switch (result) {
      case Ok():
      _deviceInfo = result.value;
      case Error():
      _deviceInfo = null;
    }
    _isLoading = false;
    notifyListeners();
  }
}
