import 'package:flutter/material.dart';

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
    );
  }
}
