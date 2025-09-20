import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

import 'package:book_finder/domain/repositories/book_repository.dart';
import 'package:book_finder/data/datasources/book_remote_data_source.dart';
import 'package:book_finder/data/datasources/book_local_data_source.dart';
import 'package:book_finder/data/datasources/database_helper.dart';

@GenerateMocks([
  BookRepository,
  BookRemoteDataSource,
  BookLocalDataSource,
  DatabaseHelper,
  http.Client,
])
void main() {}
