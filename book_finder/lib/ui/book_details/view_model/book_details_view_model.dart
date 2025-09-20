import 'package:flutter/material.dart';

import '../../../domain/models/book_search/book.dart';
import '../../../domain/use_cases/save_book.dart';

class BookDetailsViewModel extends ChangeNotifier {
  final Book book;
  final SaveBookUseCase _saveBookUseCase;

  BookDetailsViewModel({
    required this.book,
    required SaveBookUseCase saveBookUseCase,
  }) : _saveBookUseCase = saveBookUseCase;
}
