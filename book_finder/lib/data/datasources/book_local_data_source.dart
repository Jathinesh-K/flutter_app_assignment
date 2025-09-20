import '../../domain/models/book_search/book.dart';
import 'database_helper.dart';

abstract class BookLocalDataSource {
  Future<void> saveBook(Book book);
  Future<void> deleteBook(Book book);
  Future<bool> isBookSaved(String key);
}

class BookLocalDataSourceImpl implements BookLocalDataSource {
  final DatabaseHelper _databaseHelper;

  BookLocalDataSourceImpl({required DatabaseHelper databaseHelper})
    : _databaseHelper = databaseHelper;

  @override
  Future<void> deleteBook(Book book) {
    return _databaseHelper.deleteBook(book.key);
  }

  @override
  Future<bool> isBookSaved(String key) {
    return _databaseHelper.isBookSaved(key);
  }

  @override
  Future<void> saveBook(Book book) {
    return _databaseHelper.saveBook(book);
  }
}
