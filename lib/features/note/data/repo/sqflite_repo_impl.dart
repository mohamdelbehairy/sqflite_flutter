import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'sqflite_repo.dart';

class SqfliteRepoImpl extends SqfliteRepo {
  initSqfliteDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'mohamed.db');

    await openDatabase(path, onCreate: _onCreate,version: 1);
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
   CREATE TABLE notes (id INTEGER NOT NULL PRIMARY KEY,
   title TEXT NOT NULL,value TEXT NOT NULL)
   ''');

    log("database was created.");
  }
}
