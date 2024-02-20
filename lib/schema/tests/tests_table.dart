import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vcu_2023/globals/common_variables.dart';

class TestsTable {
  final tableName = tableNameTests;

  final String testID = "testID";
  final String courseID = "courseID";
  final String testName = "testName";
  final String testDescription = "testDescription";
  final String dateScheduled = "dateScheduled";
  final String duration = "duration";
  final String totalMarks = "totalMarks";
  final String passMarks = "passMarks";
  final String testStatus = "testStatus";
  final String syncStatus = "syncStatus";

  onCreate(Database db) async {
    try {
      await db.execute('''
          CREATE TABLE IF NOT EXISTS $tableName (
              $testID INTEGER PRIMARY KEY,
              $courseID INTEGER,
              $testName TEXT,
              $testDescription TEXT,
              $dateScheduled TEXT,
              $duration TEXT,
              $totalMarks TEXT,
              $passMarks TEXT,
              $testStatus TEXT,
              $syncStatus INTEGER
          )
          ''');
    } catch (e) {
      debugPrint('TestsTable.onCreate: $e');
    }
  }

  deleteTable(Database db) {
    try {
      db.delete(tableName);
    } catch (e) {
      debugPrint('TestsTable.deleteTable: $e');
    }
  }
}
