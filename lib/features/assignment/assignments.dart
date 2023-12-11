import 'package:flutter/material.dart';

class Assignments extends StatefulWidget {
  const Assignments({super.key});

  @override
  AssignmentsPage createState() => AssignmentsPage();
}

class AssignmentsPage extends State<Assignments> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignments'),
      ),
    );
  }
}
