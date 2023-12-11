import 'package:flutter/material.dart';

class Marks extends StatefulWidget {
  const Marks({super.key});

  @override
  MarksPage createState() => MarksPage();
}

class MarksPage extends State<Marks> {

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
