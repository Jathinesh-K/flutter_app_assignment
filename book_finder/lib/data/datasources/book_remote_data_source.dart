import 'dart:convert';

import 'package:flutter/foundation.dart';
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
      final data = await compute(_parseBookSearch, response.body);
      return data.docs;
    } else {
      throw Exception('Failed to load book search results');
    }
  }
}

BookSearchApiResponse _parseBookSearch(String jsonString) =>
    BookSearchApiResponse.fromJson(
      jsonDecode(jsonString) as Map<String, dynamic>,
    );
