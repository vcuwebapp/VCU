import 'package:flutter/material.dart';

class CustomParentWidget extends StatelessWidget{
  final Widget child;

  const CustomParentWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(8.0),
      child: child,
    );
  }
}