import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../../domain/models/book_search/book.dart';
import '../../../domain/use_cases/delete_book.dart';
import '../../../domain/use_cases/get_book_description.dart';
import '../../../domain/use_cases/is_book_saved.dart';
import '../../../domain/use_cases/save_book.dart';
import '../../../utils/result.dart';

class BookDetailsViewModel extends ChangeNotifier {
  final Book book;
  final SaveBookUseCase _saveBookUseCase;
  final DeleteBookUseCase _deleteBookUseCase;
  final IsBookSavedUseCase _isBookSavedUseCase;
  final GetBookDescriptionUseCase _getBookDescriptionUseCase;

  bool _isBookSaved = false;
  bool get isBookSaved => _isBookSaved;

  String _description = '';
  String get description => _description;

  bool _isDescriptionLoading = false;
  bool get isDescriptionLoading => _isDescriptionLoading;

  String? _descriptionError;
  String? get descriptionError => _descriptionError;

  final _log = Logger();

  BookDetailsViewModel({
    required this.book,
    required SaveBookUseCase saveBookUseCase,
    required DeleteBookUseCase deleteBookUseCase,
    required IsBookSavedUseCase isBookSavedUseCase,
    required GetBookDescriptionUseCase getBookDescriptionUseCase,
  }) : _saveBookUseCase = saveBookUseCase,
       _deleteBookUseCase = deleteBookUseCase,
       _isBookSavedUseCase = isBookSavedUseCase,
       _getBookDescriptionUseCase = getBookDescriptionUseCase {
    _checkIfBookIsSaved();
    _fetchDescription();
  }

  Future<void> _checkIfBookIsSaved() async {
    final result = await _isBookSavedUseCase.execute(book.key);
    if (result is Ok<bool>) {
      _isBookSaved = result.value;
      notifyListeners();
    }
  }

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
        _log.e('Failed to save book', error: result.error);
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

  Future<void> _fetchDescription() async {
    _isDescriptionLoading = true;
    notifyListeners();

    final result = await _getBookDescriptionUseCase.execute(book.key);
    switch (result) {
      case Ok<String>():
        _description = result.value;
        _descriptionError = null;
      case Error<String>():
        _descriptionError = result.error.toString();
    }

    _isDescriptionLoading = false;
    notifyListeners();
  }
}
