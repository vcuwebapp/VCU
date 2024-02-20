import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:vcu_2023/globals/common_variables.dart';

class HeadingText extends StatelessWidget {
  final String text;

  const HeadingText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      style: TextStyle(
        color: kTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 20.dp,
        overflow: TextOverflow.clip,
      ),
    );
  }
}

class SubHeadingText extends StatelessWidget {
  final String text;

  const SubHeadingText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      style: TextStyle(
        color: kTextColor,
        fontWeight: FontWeight.w500,
        fontSize: 15.dp,
        overflow: TextOverflow.clip,
      ),
    );
  }
}

class DateText extends StatelessWidget {
  final String text;

  const DateText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      style: TextStyle(
        overflow: TextOverflow.clip,
        color: kTextLightColor,
        fontSize: 12.dp,
      ),
    );
  }
}

class NormalText extends StatelessWidget {
  final String text;

  const NormalText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: TextAlign.center,
      style: TextStyle(
        overflow: TextOverflow.clip,
        color: kTextLightColor,
        fontSize: 11.dp,
      ),
    );
  }
}

class MarksText extends StatelessWidget {
  final String text;

  const MarksText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      style: TextStyle(
        overflow: TextOverflow.clip,
        color: kWhiteColor,
        fontSize: 20.dp,
      ),
    );
  }
}

Widget detailText(String title, String value) {
  return ListTile(
    title: SubHeadingText(text: title),
    subtitle: HeadingText(text: value),
  );
}
