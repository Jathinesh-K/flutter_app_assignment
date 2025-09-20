import '../models/book_search/book.dart';
import '../repositories/book_repository.dart';
import '../../utils/result.dart';

class SaveBookUseCase {
  final BookRepository _bookRepository;

  SaveBookUseCase({required BookRepository bookRepository})
    : _bookRepository = bookRepository;

  Future<Result<void>> saveBook(Book book) {
    return _bookRepository.saveBook(book);
  }
}
