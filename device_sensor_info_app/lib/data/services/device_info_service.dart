import 'package:flutter/services.dart';

abstract class DeviceInfoService {
  Future<int?> getBatteryLevel();
  Future<String> getDeviceName();
  Future<String> getOSVersion();

}

class DeviceInfoServiceImpl implements DeviceInfoService {
  static const MethodChannel _channel = MethodChannel('device/info');

  @override
  Future<int?> getBatteryLevel() async {
    try {
      final batteryLevel = await _channel.invokeMethod<int>('getBatteryLevel');
      return batteryLevel;
    } on PlatformException catch (e) {
      throw Exception('Failed to get battery level: ${e.message}');
    }
  }
  
  @override
  Future<String> getDeviceName() async {
    try {
      final deviceName = await _channel.invokeMethod<String>('getDeviceName');
      return deviceName ?? 'Unknown';
    } on PlatformException catch (e) {
      throw Exception('Failed to get device Name: ${e.message}');
    }
  }
  
  @override
  Future<String> getOSVersion() async {
    try {
      final osVersion = await _channel.invokeMethod<String>('getOSVersion');
      return osVersion ?? 'Unknown';
    } on PlatformException catch (e) {
      throw Exception('Failed to get OS version: ${e.message}');
    }
  }
}
