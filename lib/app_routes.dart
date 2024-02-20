import 'package:flutter/material.dart';
import 'package:vcu_2023/features/Tests/tests.dart';
import 'package:vcu_2023/features/Timetable/timetable.dart';
import 'package:vcu_2023/features/assignments/assignments.dart';
import 'package:vcu_2023/features/attendance/attendance_calendar.dart';
import 'package:vcu_2023/features/chatroom/chatroom.dart';
import 'package:vcu_2023/features/doubts/doubts.dart';
import 'package:vcu_2023/features/marks/marks.dart';
import 'package:vcu_2023/features/portion/portion.dart';
import 'package:vcu_2023/features/reports/reports.dart';
import 'package:vcu_2023/user_activities/notifications/notifications.dart';
import 'package:vcu_2023/user_activities/user/user.dart';

class AppRoutes {
  static const attendance = '/attendance';
  static const assignments = '/assignments';
  static const doubts = '/doubts';
  static const marks = '/marks';
  static const portion = '/portion';
  static const reports = '/reports';
  static const tests = '/tests';
  static const timetable = '/timetable';
  static const chatroom = '/chatroom';
  static const notifications = '/notifications';
  static const userprofile = '/userprofile';

  static Map<String, WidgetBuilder> routes = {
    attendance: (context) => const Attendance(),
    assignments: (context) => const Assignments(),
    doubts: (context) => const Doubts(),
    marks: (context) => const Marks(),
    portion: (context) => const Portion(),
    reports: (context) => const Reports(),
    tests: (context) => const Tests(),
    timetable: (context) => const Timetable(),
    chatroom: (context) => const Chatroom(),
    notifications: (context) => const Notifications(),
    userprofile: (context) => const UserProfile(),
  };
}
