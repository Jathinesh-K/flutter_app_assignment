import '../../domain/models/book_search/book.dart';
import '../../domain/repositories/book_repository.dart';
import '../../utils/result.dart';
import '../datasources/book_local_data_source.dart';
import '../datasources/book_remote_data_source.dart';
import '../models/book_search/book_search_model.dart';

class BookRepositoryImpl implements BookRepository {
  final BookRemoteDataSource _bookRemoteDataSource;
  final BookLocalDataSource _bookLocalDataSource;

  BookRepositoryImpl({
    required BookRemoteDataSource bookRemoteDataSource,
    required BookLocalDataSource bookLocalDataSource,
  }) : _bookRemoteDataSource = bookRemoteDataSource,
       _bookLocalDataSource = bookLocalDataSource;

  @override
  Future<Result<List<Book>>> getBooks(String title, int page) async {
    try {
      final booksearch = await _bookRemoteDataSource.getBooks(title, page);
      final books = booksearch.map((model) => model.toBook()).toList();
      return Result.ok(books);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> saveBook(Book book) async {
    try {
      await _bookLocalDataSource.saveBook(book);
      return const Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> deleteBook(Book book) async {
    try {
      await _bookLocalDataSource.deleteBook(book);
      return const Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<bool>> isBookSaved(String key) async {
    try {
      final isSaved = await _bookLocalDataSource.isBookSaved(key);
      return Result.ok(isSaved);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<String>> getBookDescription(String key) async {
    try {
      final description = await _bookRemoteDataSource.getBookDescription(key);
      return Result.ok(description);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}

extension _BookX on BookPreview {
  Book toBook() => Book(
    key: key,
    title: title,
    authorName: authorName.isNotEmpty ? authorName.first : '',
    coverImageId: coverI?.toString() ?? '',
  );
}
