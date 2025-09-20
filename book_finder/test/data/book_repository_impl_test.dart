import 'package:book_finder/data/repositories/book_repository_impl.dart';
import 'package:book_finder/data/models/book_search/book_search_model.dart';
import 'package:book_finder/domain/models/book_search/book.dart';
import 'package:book_finder/utils/result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mocks.mocks.dart';

void main() {
  late MockBookRemoteDataSource mockRemote;
  late MockBookLocalDataSource mockLocal;
  late BookRepositoryImpl repository;

  setUp(() {
    mockRemote = MockBookRemoteDataSource();
    mockLocal = MockBookLocalDataSource();
    repository = BookRepositoryImpl(
      bookRemoteDataSource: mockRemote,
      bookLocalDataSource: mockLocal,
    );
  });

  group('getBooks', () {
    test('maps BookPreview to Book domain model correctly', () async {
      final previews = [
        const BookPreview(
          key: '/works/OL1W',
          title: 'Sample Title',
          authorName: ['First Author', 'Second Author'],
          coverI: 12345,
        ),
        const BookPreview(
          key: '/works/OL2W',
          title: 'No Cover',
          authorName: [],
        ),
      ];
      when(mockRemote.getBooks(any, any)).thenAnswer((_) async => previews);

      final result = await repository.getBooks('sample', 1);
      expect(result, isA<Ok<List<Book>>>());
      final books = (result as Ok<List<Book>>).value;
      expect(books.length, 2);

      final b1 = books.first;
      expect(b1.key, '/works/OL1W');
      expect(b1.title, 'Sample Title');
      expect(b1.authorName, 'First Author');
      expect(b1.coverImageId, '12345');
      // Check edge cases
      final b2 = books[1];
      expect(b2.authorName, '');
      expect(b2.coverImageId, '');
    });

    test('returns Error when api throws', () async {
      when(mockRemote.getBooks(any, any)).thenThrow(Exception('network'));
      final result = await repository.getBooks('sample', 1);
      expect(result, isA<Error<List<Book>>>());
    });
  });

  group('local db storage actions', () {
    final book = const Book(
      key: 'k1',
      title: 'T',
      authorName: 'A',
      coverImageId: '1',
    );

    test('saveBook returns ok', () async {
      when(mockLocal.saveBook(book)).thenAnswer((_) async {});
      final result = await repository.saveBook(book);
      expect(result, isA<Ok<void>>());
    });

    test('deleteBook returns ok', () async {
      when(mockLocal.deleteBook(book)).thenAnswer((_) async {});
      final result = await repository.deleteBook(book);
      expect(result, isA<Ok<void>>());
    });

    test('isBookSaved returns ok true', () async {
      when(mockLocal.isBookSaved(book.key)).thenAnswer((_) async => true);
      final result = await repository.isBookSaved(book.key);
      expect(result, isA<Ok<bool>>());
      expect((result as Ok<bool>).value, true);
    });
  });

  group('getBookDescription', () {
    test('returns ok with description string', () async {
      when(mockRemote.getBookDescription(any)).thenAnswer((_) async => 'Desc');
      final result = await repository.getBookDescription('/works/OL123');
      expect(result, isA<Ok<String>>());
      expect((result as Ok<String>).value, 'Desc');
    });

    test('returns error when remote throws', () async {
      when(mockRemote.getBookDescription(any)).thenThrow(Exception('fail'));
      final result = await repository.getBookDescription('/works/OL123');
      expect(result, isA<Error<String>>());
    });
  });
}
