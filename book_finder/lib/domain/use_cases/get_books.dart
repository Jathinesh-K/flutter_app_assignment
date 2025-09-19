import '../models/book_search/book.dart';
import '../repositories/book_repository.dart';
import '../../utils/result.dart';

class GetBooksUseCase {
  final BookRepository _bookRepository;

  GetBooksUseCase({required BookRepository bookRepository})
    : _bookRepository = bookRepository;

  Future<Result<List<Book>>> getBooks(String title, int page) {
    return _bookRepository.getBooks(title, page);
  }
}
