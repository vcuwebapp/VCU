import 'package:flutter/material.dart';

class Tests extends StatefulWidget {
  const Tests({super.key});

  @override
  State<Tests> createState() => TestsState();
}

class TestsState extends State<Tests> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tests'),
      ),
    );
  }
}
