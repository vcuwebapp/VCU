import 'package:flutter/material.dart';

class Portion extends StatefulWidget {
  const Portion({super.key});

  @override
  PortionPage createState() => PortionPage();
}

class PortionPage extends State<Portion> {

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
