import 'package:flutter/material.dart';

import '../../../domain/models/book_search/book.dart';
import '../../../domain/use_cases/get_books.dart';
import '../../../utils/result.dart';

class BookSearchViewModel extends ChangeNotifier {
  final GetBooksUseCase _getBooksUseCase;

  BookSearchViewModel({required GetBooksUseCase getBooksUseCase})
    : _getBooksUseCase = getBooksUseCase;

  String _currentTitleQuery = '';
  int _currentPage = 1;

  final List<Book> _books = [];
  List<Book> get books => List.unmodifiable(_books);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> searchBooks({String? title, bool refreshData = false}) async {
    /// Return when the title is same as the current query avoiding cache clean and
    /// api call unnecessarily.
    if (title == _currentTitleQuery && !refreshData) {
      return;
    }

    if (title != null && title.isNotEmpty) {
      _currentPage = 1;
      _currentTitleQuery = title;

      // Clear previous books for new search query.
      _books.clear();
    }

    _isLoading = true;
    notifyListeners();

    final result = await _getBooksUseCase.getBooks(
      _currentTitleQuery,
      _currentPage,
    );

    switch (result) {
      case Ok<List<Book>>():
        _books.addAll(result.value);
        _currentPage++;
        _errorMessage = null;
      case Error<List<Book>>():
        _errorMessage = result.error.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> refreshBookSearch() =>
      searchBooks(title: _currentTitleQuery, refreshData: true);
}
