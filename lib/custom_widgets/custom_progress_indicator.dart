import 'package:flutter/material.dart';
import 'package:vcu_2023/globals/common_variables.dart';

class ShowLoading extends StatelessWidget {
  final String message;
  const ShowLoading({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(message),
        const CircularProgressIndicator.adaptive(
          backgroundColor: kPrimaryColor,
        ),
      ],
    );
  }
}
