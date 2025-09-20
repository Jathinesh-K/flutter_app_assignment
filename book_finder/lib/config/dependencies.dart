import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:http/http.dart' as http;

import '../data/datasources/book_local_data_source.dart';
import '../data/datasources/book_remote_data_source.dart';
import '../data/datasources/database_helper.dart';
import '../data/repositories/book_repository_impl.dart';
import '../domain/repositories/book_repository.dart';
import '../domain/use_cases/delete_book.dart';
import '../domain/use_cases/get_book_description.dart';
import '../domain/use_cases/is_book_saved.dart';
import '../domain/use_cases/save_book.dart';
import '../domain/use_cases/search_books.dart';
import '../ui/book_search/view_model/book_search_view_model.dart';

List<SingleChildWidget> get providers => [
  Provider(
    create: (context) => http.Client(),
    dispose: (_, client) => client.close(),
  ),
  Provider<DatabaseHelper>(
    create: (ontext) => DatabaseHelperImpl() as DatabaseHelper,
    dispose: (_, db) => db.close(),
  ),
  Provider<BookRepository>(
    create: (context) =>
        BookRepositoryImpl(
              bookRemoteDataSource: BookRemoteDataSourceImpl(
                client: context.read(),
              ),
              bookLocalDataSource: BookLocalDataSourceImpl(
                databaseHelper: context.read(),
              ),
            )
            as BookRepository,
  ),
  Provider(
    create: (context) => SearchBooksUseCase(bookRepository: context.read()),
  ),
  Provider(
    create: (context) => SaveBookUseCase(bookRepository: context.read()),
  ),
  Provider(
    create: (context) => DeleteBookUseCase(bookRepository: context.read()),
  ),
  Provider(
    create: (context) => IsBookSavedUseCase(bookRepository: context.read()),
  ),
  Provider(
    create: (context) => GetBookDescriptionUseCase(bookRepository: context.read()),
  ),
  ChangeNotifierProvider(
    create: (context) =>
        BookSearchViewModel(searchBooksUseCase: context.read()),
  ),
];
