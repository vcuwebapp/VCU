import 'package:flutter/material.dart';

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
          IconButton(
            icon: Icon(featureIcon),
            onPressed: onTap,
          ),
          Text(featureName)
        ],
      ),
    );
  }
}
