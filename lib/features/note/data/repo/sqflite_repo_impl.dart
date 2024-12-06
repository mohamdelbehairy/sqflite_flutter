import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/note_model.dart';
import 'sqflite_repo.dart';

class SqfliteRepoImpl extends SqfliteRepo {
  Database? db;

  Future<Database?> _getDb() async {
    if (db == null) {
      return db = await _initSqfliteDb();
    } else {
      return db;
    }
  }

  Future<Database> _initSqfliteDb() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'mohamed.db');

    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
   CREATE TABLE notes ("id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
   "title" TEXT NOT NULL,"value" TEXT NOT NULL)
   ''');

    log("database was created.");
  }

  @override
  Future<int> addNote(NoteModel note) async {
    Database? db = await _getDb();
    return await db!.rawInsert(
        "INSERT INTO 'notes' (title, value) VALUES ('${note.title}', '${note.value}')");
  }

  @override
  Future<List<Map>> getNote(String table) async {
    Database? db = await _getDb();
    return await db!.rawQuery("SELECT * FROM '$table'");
  }

  @override
  Future<int> updateNote(String sql) async {
    Database? db = await _getDb();
    return await db!.rawUpdate(sql);
  }

  @override
  Future<int> deleteNote(int noteID) async {
    Database? db = await _getDb();
    return await db!.rawDelete("DELETE FROM 'notes' WHERE id = $noteID");
  }
}
