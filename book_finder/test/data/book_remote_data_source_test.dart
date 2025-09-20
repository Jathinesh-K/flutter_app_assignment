import 'dart:io';

import 'package:book_finder/data/datasources/book_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../mocks.mocks.dart';

void main() {
  late MockClient mockClient;
  late BookRemoteDataSource dataSource;

  setUp(() {
    mockClient = MockClient();
    dataSource = BookRemoteDataSourceImpl(client: mockClient);
  });

  group('BookRemoteDataSource.getBooks', () {
    test('returns list of previews when status 200', () async {
      final jsonStr = await _loadJson('assets/search_response.json');
      when(mockClient.get(any)).thenAnswer(
        (_) async => http.Response(jsonStr, 200, headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
        }),
      );

      final results = await dataSource.getBooks('test', 1);

      expect(results, isNotEmpty);
    });

    test('throws exception when non-200', () async {
      when(mockClient.get(any)).thenAnswer(
        (_) async => http.Response('Not found', 404),
      );

      expect(
        () => dataSource.getBooks('test', 1),
        throwsA(isA<Exception>()),
      );
    });
  });
}

Future<String> _loadJson(String relative) async {
  final file = File(relative);
  return file.readAsString();
}
