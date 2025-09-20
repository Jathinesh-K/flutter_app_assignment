import '../../utils/result.dart';
import '../repositories/book_repository.dart';

class IsBookSavedUseCase {
  final BookRepository _bookRepository;

  IsBookSavedUseCase({required BookRepository bookRepository})
    : _bookRepository = bookRepository;

  Future<Result<bool>> execute(String key) {
    return _bookRepository.isBookSaved(key);
  }
}
