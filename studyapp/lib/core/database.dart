import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/study.dart';

class DB {

  static Future<Database> database() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'database.db');
    return openDatabase(path,  version: 1, onCreate: (db, version) async {
      await db.execute('CREATE TABLE studies (id INTEGER PRIMARY KEY, title TEXT, description TEXT, worktime INTEGER, breaktime INTEGER)');
    },);
  }

  static Future<void> insert(String table, Map<String, dynamic> data) async{
    final db = await DB.database();
    await db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<void> remove(String id) async{
    final db = await DB.database();
    await db.delete('studies', where: 'id = ?', whereArgs: [id]);
  }

  static Future<List<Map<String, Object?>>> getData(String table) async{
    final db = await DB.database();
    List<Map> lista= await db.query(table);
    print(lista);
    return db.query(table);
  }

}

//CREATE TABLE studies(id INTEGER PRIMARY KEY, title TEXT, description TEXT, worktime INTEGER, breaktime INTEGER)
    


