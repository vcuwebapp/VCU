import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vcu_2023/globals/common_variables.dart';

class PortionTable {
  final tableName = tableNamePortion;

  final String portionID = "portionID";
  final String courseID = "courseID";
  final String topicID = "topicID";
  final String topicName = "topicName";
  final String topicDescription = "topicDescription";
  final String startDate = "startDate";
  final String endDate = "endDate";
  final String status = "status";
  final String syncStatus = "syncStatus";

  onCreate(Database db) async {
    try {
      await db.execute('''
          CREATE TABLE IF NOT EXISTS $tableName (
              $portionID INTEGER PRIMARY KEY,
              $courseID INTEGER,
              $topicID INTEGER,
              $topicName TEXT,
              $topicDescription TEXT,
              $startDate TEXT,
              $endDate TEXT,
              $status TEXT,
              $syncStatus INTEGER
          )
          ''');
    } catch (e) {
      debugPrint('PortionTable.onCreate: $e');
    }
  }

  deleteTable(Database db) {
    try {
      db.delete(tableName);
    } catch (e) {
      debugPrint('PortionTable.deleteTable: $e');
    }
  }
}
