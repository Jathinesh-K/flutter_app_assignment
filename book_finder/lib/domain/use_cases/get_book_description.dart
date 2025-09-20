import '../repositories/book_repository.dart';

import '../../utils/result.dart';

class GetBookDescriptionUseCase {
  final BookRepository _repository;

  GetBookDescriptionUseCase({required BookRepository bookRepository})
    : _repository = bookRepository;

  Future<Result<String>> execute(String key) =>
      _repository.getBookDescription(key);
}
