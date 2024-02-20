import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vcu_2023/globals/common_variables.dart';

class AssignmentsTable {
  final tableName = tableNameAssignments;

  final String assignmentID = "assignmentID";
  final String studentID = "studentID";
  final String courseID = "courseID";
  final String assignmentName = "assignmentName";
  final String assignmentDescription = "assignmentDescription";
  final String dateAssigned = "dateAssigned";
  final String dueDate = "dueDate";
  final String dateSubmitted = "dateSubmitted";
  final String grade = "grade";
  final String maxGrade = "maxGrade";
  final String status = "status";
  final String type = "type";
  final String subject = "subject";
  final String syncStatus = "syncStatus";

  onCreate(Database db) async {
    try {
      await db.execute('''
          CREATE TABLE IF NOT EXISTS $tableName (
              $assignmentID INTEGER PRIMARY KEY,
              $studentID INTEGER,
              $courseID INTEGER,
              $assignmentName TEXT,
              $assignmentDescription TEXT,
              $dateAssigned TEXT,
              $dueDate TEXT,
              $dateSubmitted TEXT,
              $grade TEXT,
              $maxGrade TEXT,
              $status TEXT,
              $type TEXT,
              $subject TEXT,
              $syncStatus INTEGER
          )
          ''');
    } catch (e) {
      debugPrint('AssignmentsTable.onCreate: $e');
    }
  }

  deleteTable(Database db) {
    try {
      db.delete(tableName);
    } catch (e) {
      debugPrint('AssignmentsTable.deleteTable: $e');
    }
  }
}
