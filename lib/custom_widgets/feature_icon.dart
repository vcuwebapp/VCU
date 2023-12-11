import 'package:flutter/material.dart';
import 'package:vcu_2023/globals/common_variables.dart';

class CustomFeatureIcon extends StatelessWidget {
  final String featureName;
  final IconData featureIcon;
  final Color iconColor;
  final void Function()? onTap;
  const CustomFeatureIcon(
      {super.key,
      required this.featureName,
      required this.featureIcon,
      required this.iconColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: iconColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                featureIcon,
                color: kWhiteColor,
              ),
            ),
          ),
          Text(featureName)
        ],
      ),
    );
  }
}

class BottomBarFeature extends StatelessWidget {
  final String featureName;
  final IconData featureIcon;
  final Color iconColor;
  final void Function()? onTap;
  const BottomBarFeature(
      {super.key,
      required this.featureName,
      required this.featureIcon,
      required this.iconColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(featureIcon),
      color: kDarkPurpleColor,
      onPressed: onTap,
      tooltip: featureName,
    );
  }
}
