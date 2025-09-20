import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../utils/constants.dart';
import '../models/book_search/book_search_model.dart';

abstract class BookRemoteDataSource {
  Future<List<BookPreview>> getBooks(String title, int page);
  Future<String> getBookDescription(String bookKey);
}

class BookRemoteDataSourceImpl implements BookRemoteDataSource {
  final http.Client _client;

  BookRemoteDataSourceImpl({required http.Client client}) : _client = client;

  @override
  Future<List<BookPreview>> getBooks(String title, int page) async {
    final response = await _client.get(
      Uri.parse('${AppConstants.openLibraryBaseUrl}/search.json').replace(
        queryParameters: {
          'title': title,
          'page': page.toString(),
          'limit': '10',
        },
      ),
    );

    if (response.statusCode == 200) {
      final data = await compute(_parseBookSearch, response.body);
      return data.docs;
    } else {
      throw Exception('Failed to load book search results');
    }
  }

  @override
  Future<String> getBookDescription(String bookKey) async {
    final response = await _client.get(
      Uri.parse('${AppConstants.openLibraryBaseUrl}$bookKey.json'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final desc = data['description'];

      return desc is String ? desc.trim() : '';
    } else {
      throw Exception('Failed to load book description');
    }
  }
}

BookSearchApiResponse _parseBookSearch(String jsonString) =>
    BookSearchApiResponse.fromJson(
      jsonDecode(jsonString) as Map<String, dynamic>,
    );
