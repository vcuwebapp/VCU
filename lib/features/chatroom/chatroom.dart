import 'package:flutter/material.dart';
import 'package:vcu_2023/custom_widgets/custom_icon_card.dart';
import 'package:vcu_2023/custom_widgets/custom_parent_widget.dart';

import '../../globals/common_variables.dart';

class Chatroom extends StatefulWidget {
  const Chatroom({super.key});

  @override
  State<Chatroom> createState() => ChatroomState();
}

class ChatroomState extends State<Chatroom> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Room'),
      ),
      body: CustomParentWidget(
        child: GridView.builder(
            itemCount: subjectList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              String key = subjectList.keys.elementAt(index);
              List? value = subjectList[key];
              String subjectName = value![0];
              Color subjectColor = value[1];
              AssetImage subjectImage = value[2];
              String subjectTeachers = value[3];
              return CustomChatroomCard(
                assetImage: subjectImage,
                color: subjectColor,
                subject: subjectName,
                subHeadingText: subjectTeachers,
              );
            }),
      ),
    );
  }
}
