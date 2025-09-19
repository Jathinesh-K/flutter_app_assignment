import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../utils/constants.dart';
import '../models/book_search/book_search_model.dart';

abstract class BookRemoteDataSource {
  Future<List<BookPreview>> getBooks(String title, int page);
}

class BookRemoteDataSourceImpl implements BookRemoteDataSource {
  final http.Client _client;

  BookRemoteDataSourceImpl({required http.Client client}) : _client = client;

  @override
  Future<List<BookPreview>> getBooks(String title, int page) async {
    final response = await _client.get(
      Uri.parse(
        '${AppConstants.openLibraryBaseUrl}/search.json',
      ).replace(queryParameters: {'title': title, 'page': page.toString()}),
    );

    if (response.statusCode == 200) {
      final data = BookSearchApiResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
      return data.docs;
    } else {
      throw Exception('Failed to load book search results');
    }
  }
}
