import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vcu_2023/app_routes.dart';

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

const Color kWhiteColor = Color(0xfff2f2f2);
const Color kPurpleColor = Color(0xff6610F2);
const Color kPrimaryColor = Color(0xff1F306E);
const Color kRedColor = Color(0xFFD11149);
const Color kPinkColor = Color(0xffF5487F);
const Color kOrangeColor = Color(0xffF37933);
const Color kYellowColor = Color(0xffE6C229);
const Color kPhyColor = Color(0xff00C1B6);
const Color kChemColor = Color(0xffDDC916);
const Color kBioColor = Color(0xff34BD1D);
const Color kMathColor = Color(0xffF5487F);
const Color kTextColor = Color(0xff525252);
const Color kTextLightColor = Color(0xff8F8F8F);

final fd = DateFormat('yyyy-MM-dd HH:mm:ss');
