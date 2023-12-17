import 'package:flutter/material.dart';

class Marks extends StatefulWidget {
  const Marks({super.key});

  @override
  State<Marks> createState() => MarksState();
}

class MarksState extends State<Marks> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marks'),
      ),
    );
  }
}
