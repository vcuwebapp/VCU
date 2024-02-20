import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vcu_2023/globals/common_variables.dart';
import 'package:vcu_2023/schema/assignments/assignments_dao.dart';
import 'package:vcu_2023/schema/assignments/assignments_table.dart';
import 'package:vcu_2023/schema/attendance/attendance_dao.dart';
import 'package:vcu_2023/schema/attendance/attendance_table.dart';
import 'package:vcu_2023/schema/chatroom/chatroom_dao.dart';
import 'package:vcu_2023/schema/chatroom/chatroom_table.dart';
import 'package:vcu_2023/schema/doubts/doubts_dao.dart';
import 'package:vcu_2023/schema/doubts/doubts_table.dart';
import 'package:vcu_2023/schema/marks/marks_dao.dart';
import 'package:vcu_2023/schema/marks/marks_table.dart';
import 'package:vcu_2023/schema/portion/portion_dao.dart';
import 'package:vcu_2023/schema/portion/portion_table.dart';
import 'package:vcu_2023/schema/reports/reports_dao.dart';
import 'package:vcu_2023/schema/reports/reports_table.dart';
import 'package:vcu_2023/schema/teachers/teachers_dao.dart';
import 'package:vcu_2023/schema/teachers/teachers_table.dart';
import 'package:vcu_2023/schema/tests/tests_dao.dart';
import 'package:vcu_2023/schema/tests/tests_table.dart';
import 'package:vcu_2023/schema/timetable/timetable_dao.dart';
import 'package:vcu_2023/schema/timetable/timetable_table.dart';

class DatabaseHelper {
  static const _databaseName = "vcu.db";
  static const _databaseVersion = 1;

  // only have a single app-wide reference to the database
  late Database _database;

  // make this a singleton class
  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();
  final assignments = AssignmentsTable();
  final attendance = AttendanceTable();
  final chatroom = ChatroomTable();
  final doubts = DoubtsTable();
  final marks = MarksTable();
  final portion = PortionTable();
  final reports = ReportsTable();
  final tests = TestsTable();
  final timetable = TimetableTable();
  final teachers = TeachersTable();

  Future<Database> get database async {
    try {
      _database = await _initDatabase();
    } catch (e) {
      debugPrint('_initDatabase $e');
    }
    return _database;
  }

  ///This opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('dbPath', path);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate1,
    );
  }

  // SQL code to create the database table
  Future _onCreate1(Database db, int version) async {
    await createTables(db);
  }

  Future createTables(Database db) async {
    try {
      await assignments.onCreate(db);
      await attendance.onCreate(db);
      await chatroom.onCreate(db);
      await doubts.onCreate(db);
      await marks.onCreate(db);
      await portion.onCreate(db);
      await reports.onCreate(db);
      await tests.onCreate(db);
      await timetable.onCreate(db);
      await teachers.onCreate(db);
    } catch (e) {
      debugPrint('DB createTables() failed: $e');
    }
  }

  getSpecificColumnValue(
    String dbTable,
    String column,
    String columnName,
    String columnValue,
  ) async {
    Database db = await instance.database;
    try {
      var result = await db.rawQuery(
        "SELECT $column FROM $dbTable WHERE $columnName IN($columnValue)",
      );
      return result.isNotEmpty ? result[0][column].toString() : '1';
    } catch (e) {
      debugPrint('DB getSpecificColumnValue() failed: $e');
      return '1';
    }
  }

  Future<List<String>> getSpecificColumnRecords(
    String dbTable,
    String column,
    String columnName,
    String columnValue,
    String idColumnName,
  ) async {
    Database db = await instance.database;
    List<Map<String, Object?>> result = [];
    List<String> resultList = [];
    try {
      result = await db.rawQuery(
        "SELECT * FROM $dbTable WHERE $columnName IN($columnValue) and $idColumnName != 1 order by $column",
      );
      for (int i = 0; i < result.length; i++) {
        if (column.contains(',')) {
          List columns = column.split(',');
          List record = [];
          for (int j = 0; j < columns.length; j++) {
            record.add(result[i][columns[j]]);
          }
          resultList.add(record
              .toString()
              .replaceAll('[', '')
              .replaceAll(']', '')
              .replaceAll(',', ':'));
        } else {
          resultList.add(result[i][column].toString());
        }
      }
    } catch (e) {
      debugPrint('DB getSpecificColumnRecords() failed: $e');
    }
    return resultList;
  }

  Future insert(table, Map<String, dynamic> test) async {
    Database db = await instance.database;
    try {
      if (db.isOpen) {
        await db
            .insert(
          table,
          test,
          conflictAlgorithm: ConflictAlgorithm.replace,
        )
            .then((value) {
          debugPrint('DB insert() record inserted ($table): $test');
        });
      }
    } catch (e) {
      debugPrint('DB insert() failed: $e');
    }
  }

  Future<int?> queryRowCount(String tableName, String condition) async {
    Database db = await instance.database;
    try {
      return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $tableName $condition'),
      );
    } catch (e) {
      debugPrint('queryRowCount() failed: $e');
      return 0;
    }
  }

  Future<List<Map<String, dynamic>>> getTodoMapList(String dbTable) async {
    Database db = await instance.database;
    List<Map<String, Object?>> result = [];
    try {
      result = await db.rawQuery("SELECT * FROM $dbTable");
      return result;
    } catch (e) {
      debugPrint('DB getTodoMapList() failed: $e');
      return result;
    }
  }

  Future deleteDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    try {
      deleteDatabase(path);
    } catch (e) {
      debugPrint('DB deleteDB() failed: $e');
    }
  }

  deleteTableRecords(String dbTable, String whereClause) async {
    Database db = await instance.database;
    try {
      await db.delete(dbTable, where: whereClause);
    } catch (e) {
      debugPrint('DB deleteTableRecords() failed: $e');
    }
  }

  Future<List> getSpecificRecords(
    String dbTable,
    String column,
    String columnValue,
  ) async {
    Database db = await instance.database;
    List<Map<String, Object?>> result = [];
    try {
      result = await db
          .rawQuery("SELECT * FROM $dbTable WHERE $column = $columnValue");
    } catch (e) {
      debugPrint('DB getSelectedRecords() failed: $e');
    }
    return await filterMap(dbTable, result);
  }

  Future<int> checkSyncStatus() async {
    Database db = await instance.database;
    List<String> tables = [
      tableNameAssignments,
      tableNameAttendance,
      tableNameChatroom,
      tableNameDoubts,
      tableNameMarks,
      tableNamePortion,
      tableNameReports,
      tableNameTests,
      tableNameTimetable,
      tableNameTeachers,
    ];
    List unSyncedRecords = [];
    List<Map<String, Object?>> result;
    for (int i = 0; i < tables.length; i++) {
      result = await db.rawQuery(
        "SELECT * FROM ${tables.elementAt(i)} WHERE syncstatus = 1",
      );
      if (result.isNotEmpty) {
        unSyncedRecords.add(result);
      }
    }
    return unSyncedRecords.length;
  }

  updateSyncStatus(String dbTable, String syncStatus, String uuid) async {
    Database db = await instance.database;
    int updateCount = 0;
    try {
      updateCount = await db.rawUpdate(
        '''UPDATE $dbTable SET syncstatus = ? WHERE uuid IN($uuid)''',
        [syncStatus],
      );
    } catch (e) {
      debugPrint('DB updateSyncStatus() failed: $e');
    }
    return updateCount;
  }

  deleteUploadedRecord(
    String dbTable,
    String columnName1,
    String columnValue1,
    String extraCondition,
  ) async {
    Database db = await instance.database;
    try {
      await db.rawDelete(
        "DELETE FROM $dbTable WHERE $columnName1 = $columnValue1$extraCondition",
      );
    } catch (e) {
      debugPrint('DB deleteUploadedRecord() failed: $e');
    }
  }

  Future<List> getTableRecords(String dbTable) async {
    List todoMapList = await getTodoMapList(dbTable);
    return await filterMap(dbTable, todoMapList);
  }

  Future<List> filterMap(String dbTable, List todoMapList) async {
    if (todoMapList.isNotEmpty) {
      switch (dbTable) {
        case tableNameAssignments:
          {
            List<AssignmentsDAO> assignmentsList = <AssignmentsDAO>[];
            for (int i = 0; i < todoMapList.length; i++) {
              assignmentsList.add(AssignmentsDAO.fromMapObject(todoMapList[i]));
            }
            return assignmentsList;
          }
        case tableNameAttendance:
          {
            List<AttendanceDAO> attendanceList = <AttendanceDAO>[];
            for (int i = 0; i < todoMapList.length; i++) {
              attendanceList.add(AttendanceDAO.fromMapObject(todoMapList[i]));
            }
            return attendanceList;
          }
        case tableNameChatroom:
          {
            List<ChatroomDAO> chatroomList = <ChatroomDAO>[];
            for (int i = 0; i < todoMapList.length; i++) {
              chatroomList.add(ChatroomDAO.fromMapObject(todoMapList[i]));
            }
            return chatroomList;
          }
        case tableNameDoubts:
          {
            List<DoubtsDAO> doubtsList = <DoubtsDAO>[];
            for (int i = 0; i < todoMapList.length; i++) {
              doubtsList.add(DoubtsDAO.fromMapObject(todoMapList[i]));
            }
            return doubtsList;
          }
        case tableNameMarks:
          {
            List<MarksDAO> marksList = <MarksDAO>[];
            for (int i = 0; i < todoMapList.length; i++) {
              marksList.add(MarksDAO.fromMapObject(todoMapList[i]));
            }
            return marksList;
          }
        case tableNamePortion:
          {
            List<PortionDAO> portionList = <PortionDAO>[];
            for (int i = 0; i < todoMapList.length; i++) {
              portionList.add(PortionDAO.fromMapObject(todoMapList[i]));
            }
            return portionList;
          }
        case tableNameReports:
          {
            List<ReportsDAO> reportsList = <ReportsDAO>[];
            for (int i = 0; i < todoMapList.length; i++) {
              reportsList.add(ReportsDAO.fromMapObject(todoMapList[i]));
            }
            return reportsList;
          }
        case tableNameTests:
          {
            List<TestsDAO> testsList = <TestsDAO>[];
            for (int i = 0; i < todoMapList.length; i++) {
              testsList.add(TestsDAO.fromMapObject(todoMapList[i]));
            }
            return testsList;
          }
        case tableNameTimetable:
          {
            List<TimetableDAO> timetableList = <TimetableDAO>[];
            for (int i = 0; i < todoMapList.length; i++) {
              timetableList.add(TimetableDAO.fromMapObject(todoMapList[i]));
            }
            return timetableList;
          }
        case tableNameTeachers:
          {
            List<TeachersDAO> teachersList = <TeachersDAO>[];
            for (int i = 0; i < todoMapList.length; i++) {
              teachersList.add(TeachersDAO.fromMapObject(todoMapList[i]));
            }
            return teachersList;
          }
        default:
          return [];
      }
    } else {
      return [];
    }
  }

  updateRecord(
    String tableName,
    Map<String, Object?> values,
    String? whereClause,
    List<Object?>? whereArgs,
  ) async {
    Database db = await instance.database;
    int updateCount = 0;
    try {
      updateCount = await db.update(tableName, values,
          where: whereClause, whereArgs: whereArgs);
    } catch (e) {
      debugPrint('DB updateAssetDetailsTable() failed: $e');
    }
    return updateCount;
  }
}
