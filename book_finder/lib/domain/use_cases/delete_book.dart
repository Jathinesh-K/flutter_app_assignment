import '../models/book_search/book.dart';
import '../repositories/book_repository.dart';
import '../../utils/result.dart';

class DeleteBookUseCase {
  final BookRepository _bookRepository;

  DeleteBookUseCase({required BookRepository bookRepository})
    : _bookRepository = bookRepository;

  Future<Result<void>> execute(Book book) {
    return _bookRepository.deleteBook(book);
  }
}
