import 'package:sqflite/sqflite.dart';
import 'package:studyapp/core/database.dart';

import '../models/study.dart';

class StudyDB {

  Future<void> insertStudy(Study study) async {

  final db = await DB.instance.database;

  await db.insert(
    "studies",
    study.toMap(),
    ConflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<List<Study>> studies() async {
  // Get a reference to the database.
  final db = await DB.instance.database;

  // Query the table for all The studies.
  final List<Map<String, dynamic>> maps = await db.query("studies");

  // Convert the List<Map<String, dynamic> into a List<Dog>.
  return List.generate(maps.length, (i) {
    return Study(
      id: maps[i]['id'],
      title: maps[i]['title'],
      description: maps[i]['description'],
      workTime: maps[i]['worktime'],
      breakTime: maps[i]['breaktime']
    );
  });
}


}