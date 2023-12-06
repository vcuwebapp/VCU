import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vcu_2023/globals/common_variables.dart';
import 'package:vcu_2023/user_activities/assignment/assignment.dart';

import 'user_activities/login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterSizer(
      builder: (context, orientation, screenType){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
            colorScheme: const ColorScheme(

                brightness: Brightness.dark,
                primary: kDarkPurpleColor,
                onPrimary: kWhiteColor,
                secondary: kPinkColor,
                onSecondary: kWhiteColor,
                error: kRedColor,
                onError: kWhiteColor,
                background: kWhiteColor,
                onBackground: kDarkPurpleColor,
                surface: kWhiteColor,
                onSurface: kDarkPurpleColor),
            useMaterial3: true,
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kDarkPurpleColor,
                    foregroundColor: kWhiteColor))),
        home: const Assignment(),
      );}
    );
  }
}
