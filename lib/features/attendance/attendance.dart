import 'package:flutter/material.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  AttendancePage createState() => AttendancePage();
}

class AttendancePage extends State<Attendance> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        title: const Text('Attendance'),
      ),);
  }
}
