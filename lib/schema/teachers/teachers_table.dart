import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vcu_2023/globals/common_variables.dart';

class TeachersTable {
  final tableName = tableNameTeachers;

  final String teacherID = "teacherID";
  final String firstName = "firstName";
  final String lastName = "lastName";
  final String email = "email";
  final String contactNumber = "contactNumber";
  final String subjectSpecialization = "subjectSpecialization";
  final String qualification = "qualification";
  final String dateJoined = "dateJoined";
  final String syncStatus = "syncStatus";

  onCreate(Database db) async {
    try {
      await db.execute('''
          CREATE TABLE IF NOT EXISTS $tableName (
              $teacherID INTEGER PRIMARY KEY,
              $firstName TEXT,
              $lastName TEXT,
              $email TEXT,
              $contactNumber TEXT,
              $subjectSpecialization TEXT,
              $qualification TEXT,
              $dateJoined TEXT,
              $syncStatus INTEGER
          )
          ''');
    } catch (e) {
      debugPrint('TeachersTable.onCreate: $e');
    }
  }

  deleteTable(Database db) {
    try {
      db.delete(tableName);
    } catch (e) {
      debugPrint('TeachersTable.deleteTable: $e');
    }
  }
}
