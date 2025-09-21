import 'package:device_sensor_info_app/data/repositories/device_info_repository_impl.dart';
import 'package:device_sensor_info_app/data/services/device_info_service.dart';
import 'package:device_sensor_info_app/utils/result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockDeviceInfoService extends Mock implements DeviceInfoService {}

void main() {
  late _MockDeviceInfoService mockService;
  late DeviceInfoRepositoryImpl repository;

  setUp(() {
    mockService = _MockDeviceInfoService();
    repository = DeviceInfoRepositoryImpl(mockService);
  });

  group('DeviceInfoRepositoryImpl', () {
    test('getDeviceInfo returns Ok on success', () async {
      when(
        () => mockService.getDeviceName(),
      ).thenAnswer((_) async => 'Pixel 9');
      when(
        () => mockService.getOSVersion(),
      ).thenAnswer((_) async => 'Android 15');
      when(() => mockService.getBatteryLevel()).thenAnswer((_) async => 90);

      final result = await repository.getDeviceInfo();
      expect(result, isA<Ok>());
      final ok = result as Ok;
      expect(ok.value.deviceName, 'Pixel 9');
      expect(ok.value.osVersion, 'Android 15');
      expect(ok.value.batteryLevel, 90);
    });

    test('getDeviceInfo returns Error when getDeviceName throws', () async {
      when(
        () => mockService.getDeviceName(),
      ).thenThrow(Exception('name error'));
      when(
        () => mockService.getOSVersion(),
      ).thenAnswer((_) async => 'Android 15');
      when(() => mockService.getBatteryLevel()).thenAnswer((_) async => 90);

      final result = await repository.getDeviceInfo();
      expect(result, isA<Error>());
    });

    test('getDeviceInfo returns Error when getOSVersion throws', () async {
      when(
        () => mockService.getDeviceName(),
      ).thenAnswer((_) async => 'Pixel 9');
      when(() => mockService.getOSVersion()).thenThrow(Exception('os error'));
      when(() => mockService.getBatteryLevel()).thenAnswer((_) async => 90);

      final result = await repository.getDeviceInfo();
      expect(result, isA<Error>());
    });

    test('getDeviceInfo returns Error when getBatteryLevel throws', () async {
      when(
        () => mockService.getDeviceName(),
      ).thenAnswer((_) async => 'Pixel 9');
      when(
        () => mockService.getOSVersion(),
      ).thenAnswer((_) async => 'Android 15');
      when(
        () => mockService.getBatteryLevel(),
      ).thenThrow(Exception('battery error'));

      final result = await repository.getDeviceInfo();
      expect(result, isA<Error>());
    });

    test('getBatteryLevel returns Ok on success', () async {
      when(() => mockService.getBatteryLevel()).thenAnswer((_) async => 50);
      final result = await repository.getBatteryLevel();
      expect(result, isA<Ok<int?>>());
      expect((result as Ok<int?>).value, 50);
    });

    test('getBatteryLevel returns Error on exception', () async {
      when(() => mockService.getBatteryLevel()).thenThrow(Exception('fail'));
      final result = await repository.getBatteryLevel();
      expect(result, isA<Error<int?>>());
    });

    test('getDeviceName returns Ok', () async {
      when(() => mockService.getDeviceName()).thenAnswer((_) async => 'Device');
      final result = await repository.getDeviceName();
      expect(result, isA<Ok<String>>());
      expect((result as Ok<String>).value, 'Device');
    });

    test('getDeviceName returns Error', () async {
      when(() => mockService.getDeviceName()).thenThrow(Exception('dn error'));
      final result = await repository.getDeviceName();
      expect(result, isA<Error<String>>());
    });

    test('getOSVersion returns Ok', () async {
      when(() => mockService.getOSVersion()).thenAnswer((_) async => 'v1');
      final result = await repository.getOSVersion();
      expect(result, isA<Ok<String>>());
      expect((result as Ok<String>).value, 'v1');
    });

    test('getOSVersion returns Error', () async {
      when(() => mockService.getOSVersion()).thenThrow(Exception('os error'));
      final result = await repository.getOSVersion();
      expect(result, isA<Error<String>>());
    });
  });
}
