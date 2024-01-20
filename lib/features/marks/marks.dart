import 'package:flutter/material.dart';
import 'package:vcu_2023/custom_widgets/custom_parent_widget.dart';

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
      body: CustomParentWidget(child: TabBar(tabs: [

      ])),
    );
  }

  Widget infographics(){
    return Column(
      children: [],
    );
  }
}
