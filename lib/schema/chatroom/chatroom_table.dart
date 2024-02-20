import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vcu_2023/globals/common_variables.dart';

class ChatroomTable {
  final tableName = tableNameChatroom;

  final String chatroomID = "chatroomID";
  final String courseID = "courseID";
  final String studentID = "studentID";
  final String messageID = "messageID";
  final String messageContent = "messageContent";
  final String timestamp = "timestamp";
  final String isDeleted = "isDeleted";
  final String syncStatus = "syncStatus";

  onCreate(Database db) async {
    try {
      await db.execute('''
          CREATE TABLE IF NOT EXISTS $tableName (
              $chatroomID INTEGER PRIMARY KEY,
              $studentID INTEGER,
              $courseID INTEGER,
              $messageID INTEGER,
              $messageContent TEXT,
              $timestamp TEXT,
              $isDeleted TEXT,
              $syncStatus INTEGER
          )
          ''');
    } catch (e) {
      debugPrint('ChatroomTable.onCreate: $e');
    }
  }

  deleteTable(Database db) {
    try {
      db.delete(tableName);
    } catch (e) {
      debugPrint('ChatroomTable.deleteTable: $e');
    }
  }
}
