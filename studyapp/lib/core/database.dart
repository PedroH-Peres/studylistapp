import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';



  void main() async{
    final database = openDatabase(
    join(await getDatabasesPath(), 'studies_database.db'),
    onCreate: (db, version) {
      return db.execute(
      'CREATE TABLE studies(id INTEGER PRIMARY KEY, title TEXT, description TEXT, worktime INTEGER, breaktime INTEGER)',
    );
    },
  );
  }

