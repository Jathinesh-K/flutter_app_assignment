import 'package:device_sensor_info_app/data/repositories/sensor_repository_impl.dart';
import 'package:device_sensor_info_app/data/services/flashlight_service.dart';
import 'package:device_sensor_info_app/utils/result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockFlashlightService extends Mock implements FlashlightService {}

void main() {
  late _MockFlashlightService mockFlashlightService;
  late SensorRepositoryImpl repository;

  setUp(() {
    mockFlashlightService = _MockFlashlightService();
    repository = SensorRepositoryImpl(flashlightService: mockFlashlightService);
  });

  group('SensorRepositoryImpl', () {
    test('hasFlashlight returns Ok true', () async {
      when(
        () => mockFlashlightService.hasFlashlight(),
      ).thenAnswer((_) async => true);
      final result = await repository.hasFlashlight();
      expect(result, isA<Ok<bool>>());
      expect((result as Ok<bool>).value, isTrue);
    });

    test('hasFlashlight returns Error on exception', () async {
      when(
        () => mockFlashlightService.hasFlashlight(),
      ).thenThrow(Exception('fail'));
      final result = await repository.hasFlashlight();
      expect(result, isA<Error<bool>>());
    });

    test('toggleFlashlight returns Ok false', () async {
      when(
        () => mockFlashlightService.toggleFlashlight(false),
      ).thenAnswer((_) async => false);
      final result = await repository.toggleFlashlight(false);
      expect(result, isA<Ok<bool>>());
      expect((result as Ok<bool>).value, isFalse);
    });

    test('toggleFlashlight returns Error on exception', () async {
      when(
        () => mockFlashlightService.toggleFlashlight(true),
      ).thenThrow(Exception('toggle error'));
      final result = await repository.toggleFlashlight(true);
      expect(result, isA<Error<bool>>());
    });
  });
}
