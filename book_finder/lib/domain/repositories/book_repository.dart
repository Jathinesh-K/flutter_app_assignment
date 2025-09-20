import '../models/book_search/book.dart';
import '../../utils/result.dart';

abstract class BookRepository {
  Future<Result<List<Book>>> getBooks(String title, int page);
  Future<Result<void>> saveBook(Book book);
  Future<Result<void>> deleteBook(Book book);
  Future<Result<bool>> isBookSaved(String key);
}
