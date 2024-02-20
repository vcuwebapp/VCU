import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vcu_2023/globals/common_variables.dart';

class DoubtsTable {
  final tableName = tableNameDoubts;

  final String doubtID = "doubtID";
  final String studentID = "studentID";
  final String courseID = "courseID";
  final String assignmentID = "assignmentID";
  final String doubtDescription = "doubtDescription";
  final String dateRaised = "dateRaised";
  final String resolvedStatus = "resolvedStatus";
  final String dateResolved = "dateResolved";
  final String resolutionDescription = "resolutionDescription";
  final String syncStatus = "syncStatus";

  onCreate(Database db) async {
    try {
      await db.execute('''
          CREATE TABLE IF NOT EXISTS $tableName (
              $doubtID INTEGER PRIMARY KEY,
              $studentID INTEGER,
              $courseID INTEGER,
              $assignmentID INTEGER,
              $doubtDescription TEXT,
              $dateRaised TEXT,
              $resolvedStatus TEXT,
              $dateResolved TEXT,
              $resolutionDescription TEXT,
              $syncStatus INTEGER
          )
          ''');
    } catch (e) {
      debugPrint('DoubtsTable.onCreate: $e');
    }
  }

  deleteTable(Database db) {
    try {
      db.delete(tableName);
    } catch (e) {
      debugPrint('DoubtsTable.deleteTable: $e');
    }
  }
}
