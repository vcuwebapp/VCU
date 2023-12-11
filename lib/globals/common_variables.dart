import 'package:flutter/material.dart';
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
    kDarkPurpleColor,
    Icons.person_rounded
  ],
};

const Color kWhiteColor = Color(0xffffffff);
const Color kPurpleColor = Color(0xff6610F2);
const Color kDarkPurpleColor = Color(0xff1F306E);
const Color kRedColor = Color(0xFFD11149);
const Color kPinkColor = Color(0xffF5487F);
const Color kOrangeColor = Color(0xffF37933);
const Color kYellowColor = Color(0xffE6C229);
