import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../domain/models/book_search/book.dart';

abstract class DatabaseHelper {
  Future<Database> get database;
  Future<void> saveBook(Book book);
  Future<void> deleteBook(String key);
  Future<bool> isBookSaved(String key);
  Future<void> close();
}

class DatabaseHelperImpl implements DatabaseHelper {
  Database? _database;
  static const tableName = 'books';

  @override
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDB('$tableName.db');
    return _database!;
  }

  Future<Database> _initDB(String table) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, tableName);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableName(
        key TEXT PRIMARY KEY,
        title TEXT NOT NULL,
        author_name TEXT NOT NULL,
        cover_image_id TEXT NOT NULL
      )
    ''');
  }

  @override
  Future<void> close() async {
    final db = _database;
    if (db != null && db.isOpen) {
      await db.close();
      _database = null;
    }
  }

  @override
  Future<void> saveBook(Book book) async {
    final db = await database;
    await db.insert(
      tableName,
      book.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> deleteBook(String key) async {
    final db = await database;
    await db.delete(tableName, where: 'key = ?', whereArgs: [key]);
  }

  @override
  Future<bool> isBookSaved(String key) async {
    final db = await database;
    final books = await db.query(
      tableName,
      columns: ['key'],
      where: 'key = ?',
      whereArgs: [key],
    );

    return books.isNotEmpty;
  }
}
