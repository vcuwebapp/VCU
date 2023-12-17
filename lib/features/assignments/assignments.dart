import 'package:flutter/material.dart';

class Assignments extends StatefulWidget {
  const Assignments({super.key});

  @override
  State<Assignments> createState() => AssignmentState();
}

class AssignmentState extends State<Assignments> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text("Today"),
            ],
          ),
        ),
      ),
    );
  }
}
