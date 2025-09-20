import '../models/book_search/book.dart';
import '../repositories/book_repository.dart';
import '../../utils/result.dart';

class SearchBooksUseCase {
  final BookRepository _bookRepository;

  SearchBooksUseCase({required BookRepository bookRepository})
    : _bookRepository = bookRepository;

  Future<Result<List<Book>>> execute(String title, int page) {
    return _bookRepository.getBooks(title, page);
  }
}
