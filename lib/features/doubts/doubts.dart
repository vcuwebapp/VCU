import 'package:flutter/material.dart';

class Doubts extends StatefulWidget {
  const Doubts({super.key});

  @override
  DoubtsPage createState() => DoubtsPage();
}

class DoubtsPage extends State<Doubts> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doubts'),
      ),
    );
  }
}
