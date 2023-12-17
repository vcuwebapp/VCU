import 'package:flutter/material.dart';

class Portion extends StatefulWidget {
  const Portion({super.key});

  @override
  State<Portion> createState() => PortionState();
}

class PortionState extends State<Portion> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        title: const Text('Portion'),
      ),);
  }
}
