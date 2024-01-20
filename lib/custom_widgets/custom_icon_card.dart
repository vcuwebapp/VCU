import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:vcu_2023/custom_widgets/custom_texts.dart';
import 'package:vcu_2023/globals/common_variables.dart';

class CustomIconCard extends StatelessWidget {
  final String headingText;
  final String subHeadingText;
  final String dateText;
  final Color color;
  final AssetImage assetImage;
  const CustomIconCard(
      {super.key,
      required this.assetImage,
      required this.color,
      required this.dateText,
      required this.headingText,
      required this.subHeadingText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: assetImage),
                   borderRadius: BorderRadius.circular(4)),
              height: 8.h,
              width: 8.h,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingText(text: headingText,),
              SubHeadingText(text: subHeadingText,),
              DateText(text: dateText, ),
            ],
          )
        ],
      ),
    );
  }
}
