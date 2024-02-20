import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vcu_2023/globals/common_variables.dart';

class ReportsTable {
  final tableName = tableNameReports;

  final String reportID = "reportID";
  final String studentID = "studentID";
  final String courseID = "courseID";
  final String totalMarks = "totalMarks";
  final String maxMarks = "maxMarks";
  final String percentage = "percentage";
  final String grade = "grade";
  final String attendance = "attendance";
  final String dateGenerated = "dateGenerated";
  final String syncStatus = "syncStatus";

  onCreate(Database db) async {
    try {
      await db.execute('''
          CREATE TABLE IF NOT EXISTS $tableName (
              $reportID INTEGER PRIMARY KEY,
              $studentID INTEGER,
              $courseID INTEGER,
              $totalMarks INTEGER,
              $maxMarks TEXT,
              $percentage TEXT,
              $grade TEXT,
              $attendance TEXT,
              $dateGenerated TEXT,
              $syncStatus INTEGER
          )
          ''');
    } catch (e) {
      debugPrint('ReportsTable.onCreate: $e');
    }
  }

  deleteTable(Database db) {
    try {
      db.delete(tableName);
    } catch (e) {
      debugPrint('ReportsTable.deleteTable: $e');
    }
  }
}
