import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vcu_2023/globals/common_variables.dart';

class AttendanceTable {
  final tableName = tableNameAttendance;

  final String attendanceID = "attendanceID";
  final String studentID = "studentID";
  final String courseID = "courseID";
  final String date = "date";
  final String status = "status";
  final String reason = "reason";
  final String syncStatus = "syncStatus";

  onCreate(Database db) async {
    try {
      await db.execute('''
          CREATE TABLE IF NOT EXISTS $tableName (
              $attendanceID INTEGER PRIMARY KEY,
              $studentID INTEGER,
              $courseID INTEGER,
              $date INTEGER,
              $status TEXT,
              $reason TEXT,
              $syncStatus INTEGER
          )
          ''');
    } catch (e) {
      debugPrint('AttendanceTable.onCreate: $e');
    }
  }

  deleteTable(Database db) {
    try {
      db.delete(tableName);
    } catch (e) {
      debugPrint('AttendanceTable.deleteTable: $e');
    }
  }
}
