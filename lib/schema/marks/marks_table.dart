import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vcu_2023/globals/common_variables.dart';

class MarksTable {
  final tableName = tableNameMarks;

  final String marksID = "marksID";
  final String studentID = "studentID";
  final String courseID = "courseID";
  final String assignmentID = "assignmentID";
  final String marksObtained = "marksObtained";
  final String totalMarks = "totalMarks";
  final String grade = "grade";
  final String dateGraded = "dateGraded";
  final String syncStatus = "syncStatus";

  onCreate(Database db) async {
    try {
      await db.execute('''
          CREATE TABLE IF NOT EXISTS $tableName (
              $marksID INTEGER PRIMARY KEY,
              $studentID INTEGER,
              $courseID INTEGER,
              $assignmentID INTEGER,
              $marksObtained TEXT,
              $totalMarks TEXT,
              $grade TEXT,
              $dateGraded TEXT,
              $syncStatus INTEGER
          )
          ''');
    } catch (e) {
      debugPrint('MarksTable.onCreate: $e');
    }
  }

  deleteTable(Database db) {
    try {
      db.delete(tableName);
    } catch (e) {
      debugPrint('MarksTable.deleteTable: $e');
    }
  }
}
