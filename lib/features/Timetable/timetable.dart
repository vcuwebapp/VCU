import 'package:flutter/material.dart';

class Timetable extends StatefulWidget {
  const Timetable({super.key});

  @override
  TimetablePage createState() => TimetablePage();
}

class TimetablePage extends State<Timetable> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        title: const Text('Timetable'),
      ),);
  }
}
