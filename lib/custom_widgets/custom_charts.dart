import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TestPieChartCard extends StatelessWidget{
  final double totalTests;
  final double totalMarks;

  const TestPieChartCard({super.key, required this.totalTests, required this.totalMarks});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [

        ],
      ),
    );
  }
  
}