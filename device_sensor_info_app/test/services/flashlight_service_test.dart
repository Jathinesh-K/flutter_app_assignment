import 'package:device_sensor_info_app/data/services/flashlight_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('device/sensor');
  final Function setMockHandler = TestDefaultBinaryMessengerBinding
      .instance
      .defaultBinaryMessenger
      .setMockMethodCallHandler;
  late final FlashlightServiceImpl service;

  setUpAll(() {
    service = FlashlightServiceImpl();
  });

  tearDown(() {
    setMockHandler(channel, null);
  });

  group('FlashlightServiceImpl', () {
    test('hasFlashlight returns true', () async {
      setMockHandler(channel, (call) async {
        expect(call.method, 'hasFlashlight');
        return true;
      });
      final result = await service.hasFlashlight();
      expect(result, isTrue);
    });

    test('hasFlashlight returns false when null', () async {
      setMockHandler(channel, (call) async => null);
      final result = await service.hasFlashlight();
      expect(result, isFalse);
    });

    test(
      'hasFlashlight throws mapped exception on PlatformException',
      () async {
        setMockHandler(channel, (call) async {
          throw PlatformException(code: 'ERROR');
        });
        expect(
          service.hasFlashlight(),
          throwsA(
            isA<Exception>().having(
              (e) => e.toString(),
              'msg',
              contains('Flashlight availability unknown'),
            ),
          ),
        );
      },
    );

    test('toggleFlashlight enable true returns true', () async {
      setMockHandler(channel, (call) async {
        expect(call.method, 'toggleFlashlight');
        expect(call.arguments, containsPair('enable', true));
        return true;
      });
      final result = await service.toggleFlashlight(true);
      expect(result, isTrue);
    });

    test('toggleFlashlight returns false when null', () async {
      setMockHandler(channel, (call) async => null);
      final result = await service.toggleFlashlight(false);
      expect(result, isFalse);
    });

    test(
      'toggleFlashlight throws mapped exception on PlatformException',
      () async {
        setMockHandler(channel, (call) async {
          throw PlatformException(code: 'ERROR');
        });
        expect(
          service.toggleFlashlight(true),
          throwsA(
            isA<Exception>().having(
              (e) => e.toString(),
              'msg',
              contains('Unable to toggle Flashlight'),
            ),
          ),
        );
      },
    );
  });
}
