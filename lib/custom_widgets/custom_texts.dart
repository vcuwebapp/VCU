import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  final String text;
  const HeadingText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        overflow: TextOverflow.clip,
      ),
    );
  }
}
