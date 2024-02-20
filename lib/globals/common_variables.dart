import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcu_2023/app_routes.dart';
import 'package:vcu_2023/schema/database.dart';

DatabaseHelper dbHelper = DatabaseHelper.instance;
late SharedPreferences prefs;

Map cardFeatureList = {
  "attendance": ['Attendance', AppRoutes.attendance, kRedColor, Icons.person],
  "assignments": [
    'Assignments',
    AppRoutes.assignments,
    kYellowColor,
    Icons.task
  ],
  "doubts": [
    'Doubts',
    AppRoutes.doubts,
    kPinkColor,
    Icons.question_answer_rounded
  ],
  "marks": ['Marks', AppRoutes.marks, kOrangeColor, Icons.grade_rounded],
  "portion": [
    'Portion',
    AppRoutes.portion,
    kRedColor,
    Icons.book_online_rounded
  ],
  "reports": [
    'Reports',
    AppRoutes.reports,
    kYellowColor,
    Icons.file_copy_rounded
  ],
};

Map navigationFeatureList = {
  "tests": [
    'Tests',
    AppRoutes.tests,
    kPinkColor,
    Icons.align_horizontal_left_rounded
  ],
  "timetable": [
    'Timetable',
    AppRoutes.timetable,
    kOrangeColor,
    Icons.schedule_outlined
  ],
  "chatroom": ['Chat Room', AppRoutes.chatroom, kRedColor, Icons.chat_rounded],
  "userprofile": [
    'User Profile',
    AppRoutes.userprofile,
    kPrimaryColor,
    Icons.person_rounded
  ],
};

Map<String, List> subjectList = {
  "bio": [
    'Biology',
    kBioColor,
    const AssetImage("assets/images/bioico.png"),
    'Sadik Sir\nShelke Sir',
  ],
  "chem": [
    'Chemistry',
    kChemColor,
    const AssetImage("assets/images/chemico.png"),
    'Prajapati Sir\nRachana Madam',
  ],
  "maths": [
    'Mathematics',
    kMathColor,
    const AssetImage("assets/images/matico.png"),
    'Mayur Sir\nVishwas Sir',
  ],
  "phy": [
    'Physics',
    kPhyColor,
    const AssetImage("assets/images/phyico.png"),
    'Sadik Sir\nShelke Sir',
  ],
};

const Color kWhiteColor = Color(0xffffffff);
const Color kOffWhiteColor = Color(0xffe3e7ec);
const Color kPurpleColor = Color(0xff6610F2);
const Color kPrimaryColor = Color(0xff1F306E);
const Color kRedColor = Color(0xFFD11149);
const Color kGreenColor = Color(0xff2f9508);
const Color kPinkColor = Color(0xffF5487F);
const Color kOrangeColor = Color(0xffF37933);
const Color kYellowColor = Color(0xffE6C229);
const Color kPhyColor = Color(0xff00C1B6);
const Color kChemColor = Color(0xffDDC916);
const Color kBioColor = Color(0xff34BD1D);
const Color kMathColor = Color(0xffF5487F);
const Color kTextColor = Color(0xff525252);
const Color kTextLightColor = Color(0xff8F8F8F);

final fdt = DateFormat('yyyy-MM-dd HH:mm:ss');
const String statusCompleted = 'completed';
const String statusAssigned = 'assigned';
const String statusMissed = 'missed';

const String tableNameAssignments = 'assignments';
const String tableNameAttendance = 'attendance';
const String tableNameChatroom = 'chatroom';
const String tableNameDoubts = 'doubts';
const String tableNameMarks = 'marks';
const String tableNamePortion = 'portion';
const String tableNameReports = 'reports';
const String tableNameTests = 'tests';
const String tableNameTimetable = 'timetable';
const String tableNameTeachers = 'teachers';
