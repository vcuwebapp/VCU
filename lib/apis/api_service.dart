import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:vcu_2023/schema/assignments/assignments_dao.dart';
import 'package:vcu_2023/schema/chatroom/chatroom_dao.dart';
import 'package:vcu_2023/schema/doubts/doubts_dao.dart';
import 'package:vcu_2023/schema/marks/marks_dao.dart';
import 'package:vcu_2023/schema/portion/portion_dao.dart';
import 'package:vcu_2023/schema/reports/reports_dao.dart';
import 'package:vcu_2023/schema/teachers/teachers_dao.dart';
import 'package:vcu_2023/schema/tests/tests_dao.dart';
import 'package:vcu_2023/schema/timetable/timetable_dao.dart';

import '../schema/attendance/attendance_dao.dart';
import 'api_endpoint.dart';

class ApiService {
  Future<List<AssignmentsDAO>?> getAssignments() async {
    List<AssignmentsDAO> assignmentsList = [];
    try {
      var url =
          Uri.parse(ApiConstants.baseUrl + ApiConstants.assignmentsEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        assignmentsList = assignmentModelFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return assignmentsList;
  }

  Future<List<AttendanceDAO>?> getAttendance() async {
    List<AttendanceDAO> attendanceList = [];
    try {
      var url =
          Uri.parse(ApiConstants.baseUrl + ApiConstants.attendanceEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        attendanceList = attendanceModelFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return attendanceList;
  }

  Future<List<ChatroomDAO>?> getChatroom() async {
    List<ChatroomDAO> chatroomList = [];
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.chatroomEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        chatroomList = chatroomModelFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return chatroomList;
  }

  Future<List<DoubtsDAO>?> getDoubts() async {
    List<DoubtsDAO> doubtsList = [];
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.doubtsEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        doubtsList = doubtsModelFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return doubtsList;
  }

  Future<List<MarksDAO>?> getMarks() async {
    List<MarksDAO> marksList = [];
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.marksEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        marksList = marksModelFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return marksList;
  }

  Future<List<PortionDAO>?> getPortion() async {
    List<PortionDAO> portionList = [];
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.portionEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        portionList = portionModelFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return portionList;
  }

  Future<List<ReportsDAO>?> getReports() async {
    List<ReportsDAO> reportsList = [];
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.reportsEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        reportsList = reportsModelFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return reportsList;
  }

  Future<List<TeachersDAO>?> getTeachers() async {
    List<TeachersDAO> attendanceList = [];
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.teachersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        attendanceList = teachersModelFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return attendanceList;
  }

  Future<List<TestsDAO>?> getTests() async {
    List<TestsDAO> testsList = [];
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.testsEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        testsList = testsModelFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return testsList;
  }

  Future<List<TimetableDAO>?> getTimetable() async {
    List<TimetableDAO> timetableList = [];
    try {
      var url =
          Uri.parse(ApiConstants.baseUrl + ApiConstants.timetableEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        timetableList = timetableModelFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return timetableList;
  }
}
