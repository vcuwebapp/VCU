import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vcu_2023/globals/common_variables.dart';

class TimetableTable {
  final tableName = tableNameTimetable;

  final String timetableID = "timetableID";
  final String courseID = "courseID";
  final String dayOfWeek = "dayOfWeek";
  final String startTime = "startTime";
  final String endTime = "endTime";
  final String location = "location";
  final String instructorID = "instructorID";
  final String syncStatus = "syncStatus";

  onCreate(Database db) async {
    try {
      await db.execute('''
          CREATE TABLE IF NOT EXISTS $tableName (
              $timetableID INTEGER PRIMARY KEY,
              $courseID INTEGER,
              $dayOfWeek TEXT,
              $startTime TEXT,
              $endTime TEXT,
              $location TEXT,
              $instructorID INTEGER,
              $syncStatus INTEGER
          )
          ''');
    } catch (e) {
      debugPrint('TimetableTable.onCreate: $e');
    }
  }

  deleteTable(Database db) {
    try {
      db.delete(tableName);
    } catch (e) {
      debugPrint('TimetableTable.deleteTable: $e');
    }
  }
}
