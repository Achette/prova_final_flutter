import 'package:prova_final_flutter/screens/game_form.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'games_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE games(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        platform TEXT NOT NULL,
        publisher TEXT NOT NULL,
        releaseYear INTEGER NOT NULL,
        genre TEXT NOT NULL,
        rating REAL NOT NULL
      )
    ''');
  }

  Future<int> insertGame(Game game) async {
    final db = await database;
    return await db.insert('games', game.toMap());
  }

  Future<List<Game>> getGames() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('games');
    return List.generate(maps.length, (i) => Game.fromMap(maps[i]));
  }

  Future<int> deleteGame(int id) async {
    final db = await database;
    return await db.delete(
      'games',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
