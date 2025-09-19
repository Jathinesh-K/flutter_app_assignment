import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:http/http.dart' as http;

import '../data/datasources/book_local_data_source.dart';
import '../data/datasources/book_remote_data_source.dart';
import '../data/repositories/book_repository_impl.dart';
import '../domain/repositories/book_repository.dart';

List<SingleChildWidget> get providers => [
  Provider(create: (context) => http.Client()),
  Provider(
    create: (context) => BookRepositoryImpl(
      bookRemoteDataSource: BookRemoteDataSourceImpl(context.read()),
      bookLocalDataSource: BookLocalDataSourceImpl(),
    ) as BookRepository,
  ),
];
