import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../../domain/models/book_search/book.dart';
import '../../../domain/use_cases/delete_book.dart';
import '../../../domain/use_cases/save_book.dart';
import '../../../utils/result.dart';

class BookDetailsViewModel extends ChangeNotifier {
  final Book book;
  final SaveBookUseCase _saveBookUseCase;
  final DeleteBookUseCase _deleteBookUseCase;

  bool _isBookSaved = false;
  bool get isBookSaved => _isBookSaved;

  final _log = Logger();

  BookDetailsViewModel({
    required this.book,
    required SaveBookUseCase saveBookUseCase,
    required DeleteBookUseCase deleteBookUseCase,
  }) : _saveBookUseCase = saveBookUseCase,
       _deleteBookUseCase = deleteBookUseCase;

  void toggleBookSave() {
    if (!isBookSaved) {
      _saveBook();
    } else {
      _deleteBook();
    }
  }

  Future<void> _saveBook() async {
    _isBookSaved = true;
    notifyListeners();

    final result = await _saveBookUseCase.execute(book);

    switch (result) {
      case Error():
        _log.e('Failed to save book');
        _isBookSaved = false;
        notifyListeners();
      case Ok():
        _log.d('Book saved successfully');
    }
  }

  Future<void> _deleteBook() async {
    _isBookSaved = false;
    notifyListeners();

    final result = await _deleteBookUseCase.execute(book);

    switch (result) {
      case Error():
        _log.e('Failed to delete book');
        _isBookSaved = true;
        notifyListeners();
      case Ok():
        _log.d('Book deleted successfully');
    }
  }
}
