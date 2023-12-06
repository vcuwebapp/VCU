import 'package:flutter/material.dart';
import 'package:vcu_2023/user_activities/login/login.dart';

class PolicyPage extends StatelessWidget {
  const PolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy Policy')),
      floatingActionButton: FloatingActionButton.extended(
          label: const Text('Agree & Proceed'),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Login()));
          }),
    );
  }
}
