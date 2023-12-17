import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upgrader/upgrader.dart';
import 'package:vcu_2023/app_routes.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vcu_2023/globals/common_variables.dart';
import 'package:vcu_2023/globals/shared_prefs_list.dart';
import 'package:vcu_2023/user_activities/home/home.dart';
import 'package:vcu_2023/user_activities/policy.dart';import 'package:vcu_2023/user_activities/assignment/assignment.dart';

import 'user_activities/login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await createUserSharedPrefs();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(
    isPolicyAcknowledged: prefs.getBool('isPolicyAcknowledged')!,
    isLoggedIn: prefs.getBool('isLoggedIn')!,
  ));
}

class MyApp extends StatelessWidget {
  final bool isPolicyAcknowledged;
  final bool isLoggedIn;
  const MyApp(
      {super.key,
      required this.isPolicyAcknowledged,
      required this.isLoggedIn});
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
