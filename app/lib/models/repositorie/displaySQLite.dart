import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../models/display.dart';
class DisplaySQLite{
  Database _database;
  Database get db{
    return _database;
  }
  Future<void> DBconstructor() async{
    _database = await openDatabase(
      join(await getDatabasesPath(), 'displays_database_1_0.db'),
      onCreate: (db, version) {
        return db.execute(
          """CREATE TABLE Display (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                name TEXT,
                type TEXT,
                favorite INTEGER,
                broker TEXT,
                topic TEXT,
                measurement INTEGER
            );""",
        );
      },
      version: 1,
    );
  }
  Future<void> insert(Display display) async {
    await _database.insert(
      'Display',
      display.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<List<Display>> getAll() async {
    final List<Map<String, dynamic>> maps = await _database.query('Display');
    return List.generate(maps.length, (i) {
      return Display.fromJson(maps[i]);
    });
  }
  Future<void> update(Display display) async {
    await _database.update(
      'Display',
      display.toJson(),
      where: "id = ?",
      whereArgs: [display.id],
    );
  }
  Future<void> delete(int id) async {
    await _database.delete(
      'Display',
      // Use a `where` clause to delete a specific dog.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}