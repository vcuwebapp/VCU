import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:vcu_2023/custom_widgets/custom_texts.dart';
import 'package:vcu_2023/globals/common_variables.dart';

class CustomIconCard extends StatelessWidget {
  final String headingText;
  final String subHeadingText;
  final String dateText;
  final Color color;
  final AssetImage? assetImage;
  final List? assetIcon;
  final String? status;

  const CustomIconCard({super.key,
    this.status,
    this.assetImage,
    this.assetIcon,
    required this.color,
    required this.dateText,
    required this.headingText,
    required this.subHeadingText});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipPath(
        clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.dp))),
        child: Container(
          decoration: BoxDecoration(
              border: status == null
                  ? null
                  : Border(
                  right:
                  BorderSide(color: getStatusColor(status!), width: 5)),
              color: color,
              borderRadius: BorderRadius.circular(15.dp)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: assetIcon != null ? assetIcon![0] : null,
                      image: assetImage != null
                          ? DecorationImage(image: assetImage!)
                          : null,
                      borderRadius: BorderRadius.circular(15.dp)),
                  height: 8.h,
                  width: 8.h,
                  child: assetIcon != null
                      ? Center(child: MarksText(text: assetIcon![1].toString()))
                      : null,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadingText(
                    text: headingText,
                  ),
                  SubHeadingText(
                    text: subHeadingText,
                  ),
                  DateText(
                    text: dateText,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

getStatusColor(String status) {
  switch (status) {
    case statusCompleted:
      return kGreenColor;
    case statusAssigned:
      return kYellowColor;
    case statusMissed:
      return kRedColor;
  }
}

class CustomChatroomCard extends StatelessWidget {
  final String subject;
  final String subHeadingText;
  final Color color;
  final AssetImage assetImage;

  const CustomChatroomCard({super.key,
    required this.assetImage,
    required this.color,
    required this.subject,
    required this.subHeadingText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    image: DecorationImage(image: assetImage),
                    borderRadius: BorderRadius.circular(15.dp)),
                height: 8.h,
                width: 8.h,
              ),
            ),
            NormalText(
              text: subHeadingText,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 24.dp,
                    decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15.dp),
                          bottomRight: Radius.circular(15.dp),
                        )),
                    child: Center(
                      child: Text(
                        subject,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
