import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDatabase {
  Future<Database> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory(); // Changed to Documents directory
    String path = join(directory.path, 'cureOption.db');
    var db = await openDatabase(path, onCreate: (db, version) async {
      await db.execute('''
          create table State(
           state_id INTEGER PRIMARY KEY AUTOINCREMENT,
           state_name TEXT NOT NULL
          )''');
      await db.execute('''
          create table City(
           city_id INTEGER PRIMARY KEY AUTOINCREMENT,
           city_name TEXT NOT NULL,
           state_id INTEGER NOT NULL,
           FOREIGN KEY (state_id) REFERENCES State(state_id)
          )
        ''');
    }, version: 1);
    return db;
  }

  Future<List<Map<String, dynamic>>> selectAllState() async {
    Database db = await initDatabase();
    return await db.rawQuery("select * from State");
  }

  Future<void> insertState(Map<String, dynamic> state) async {
    Database db = await initDatabase();
    await db.insert("State", state);
  }

  Future<void> updateState(Map<String, dynamic> state) async {
    Database db = await initDatabase();
    await db.update("State", state,
        where: "state_id = ?", whereArgs: [state["state_id"]]);
  }

  Future<void> deleteState(int state_id) async {
    Database db = await initDatabase();
    await db.delete("State", where: "state_id = ?", whereArgs: [state_id]);
  }
}
