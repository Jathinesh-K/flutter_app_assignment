class DeviceInfo {
  final String deviceName;
  final String osVersion;
  final int? batteryLevel;

  const DeviceInfo({
    required this.deviceName,
    required this.osVersion,
    this.batteryLevel,
  });

  @override
  String toString() {
    return 'DeviceInfo(deviceName: $deviceName, osVersion: $osVersion, batterLevel: $batteryLevel)';
  }
}
