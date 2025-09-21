import 'package:device_sensor_info_app/data/services/device_info_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('device/info');
  final Function setMockHandler = TestDefaultBinaryMessengerBinding
      .instance
      .defaultBinaryMessenger
      .setMockMethodCallHandler;
  late final DeviceInfoServiceImpl service;

  setUpAll(() {
    service = DeviceInfoServiceImpl();
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  group('DeviceInfoServiceImpl', () {
    test('getBatteryLevel returns value', () async {
      setMockHandler(channel, (call) async {
        expect(call.method, 'getBatteryLevel');
        return 87;
      });
      final level = await service.getBatteryLevel();
      expect(level, 87);
    });

    test('getBatteryLevel returns null when platform returns null', () async {
      setMockHandler(channel, (call) async => null);
      final level = await service.getBatteryLevel();
      expect(level, isNull);
    });

    test(
      'getBatteryLevel throws mapped exception on PlatformException',
      () async {
        setMockHandler(channel, (call) async {
          throw PlatformException(code: 'ERROR', message: 'failed');
        });
        expect(
          service.getBatteryLevel(),
          throwsA(
            isA<Exception>().having(
              (e) => e.toString(),
              'message',
              contains('Failed to get battery level'),
            ),
          ),
        );
      },
    );

    test('getDeviceName returns provided name', () async {
      setMockHandler(channel, (call) async {
        if (call.method == 'getDeviceName') return 'Pixel 9';
        return null;
      });
      final name = await service.getDeviceName();
      expect(name, 'Pixel 9');
    });

    test('getDeviceName returns Unknown when null', () async {
      setMockHandler(channel, (call) async => null);
      final name = await service.getDeviceName();
      expect(name, 'Unknown');
    });

    test('getOSVersion returns provided value', () async {
      setMockHandler(channel, (call) async {
        if (call.method == 'getOSVersion') return 'iOS 18.0';
        return null;
      });
      final os = await service.getOSVersion();
      expect(os, 'iOS 18.0');
    });

    test('getOSVersion returns Unknown when null', () async {
      setMockHandler(channel, (call) async => null);
      final os = await service.getOSVersion();
      expect(os, 'Unknown');
    });

    test('getOSVersion throws mapped exception on PlatformException', () async {
      setMockHandler(channel, (call) async {
        throw PlatformException(code: 'ERROR', message: 'boom');
      });
      expect(
        service.getOSVersion(),
        throwsA(
          isA<Exception>().having(
            (e) => e.toString(),
            'message',
            contains('Failed to get OS version'),
          ),
        ),
      );
    });
  });
}
