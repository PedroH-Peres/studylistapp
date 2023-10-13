import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/study.dart';

class DB {

  DB._();

  static final DB instance = DB._();
  static Database? _database;

  get database async{
    if(database != null) return _database;
    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'studies_database.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute('CREATE TABLE studies(id INTEGER PRIMARY KEY, title TEXT, description TEXT, worktime INTEGER, breaktime INTEGER)');
      }
    );  
  }

}

    


