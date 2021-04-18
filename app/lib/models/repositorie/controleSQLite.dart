import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../models/controle.dart';
class ControleSQLite{
  Database _database;
  Database get db{
    return _database;
  }
  Future<void> DBconstructor() async{
    _database = await openDatabase(
      join(await getDatabasesPath(), 'controles_database_1_0.db'),
      onCreate: (db, version) {
        return db.execute(
          """CREATE TABLE Controle (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                name TEXT,
                type TEXT,
                favorite INTEGER,
                broker TEXT,
                topic TEXT
            );""",
        );
      },
      version: 1,
    );
  }
  Future<void> insert(Controle controle) async {
    await _database.insert(
      'Controle',
      controle.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<List<Controle>> getAll() async {
    final List<Map<String, dynamic>> maps = await _database.query('Controle');
    return List.generate(maps.length, (i) {
      return Controle.fromJson(maps[i]);
    });
  }
  Future<void> update(Controle controle) async {
    await _database.update(
      'Controle',
      controle.toJson(),
      where: "id = ?",
      whereArgs: [controle.id],
    );
  }
  Future<void> delete(int id) async {
    await _database.delete(
      'Controle',
      // Use a `where` clause to delete a specific dog.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}