import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:vcu_2023/custom_widgets/custom_texts.dart';
import 'package:vcu_2023/globals/common_variables.dart';

class TestChartCard extends StatelessWidget {
  final double totalTests;
  final double totalMarks;

  const TestChartCard(
      {super.key, required this.totalTests, required this.totalMarks});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: CircularPercentIndicator(
          radius: 50.dp,
          lineWidth: 5.0,
          percent: 0.8,
          center: Text("80%"),
          progressColor: Colors.green,
        ),
        subtitle: Column(
          children: [
            detailText('Total Tests', totalTests.toString()),
            detailText('Total Marks Scored', totalMarks.toString()),
          ],
        ),
      ),
    );
  }
}

class BarChartCard extends StatelessWidget {
  const BarChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: HeadingText(text: 'Subject'),
        subtitle: BarChart(BarChartData(
            borderData: FlBorderData(
                border: const Border(
              top: BorderSide.none,
              right: BorderSide.none,
              left: BorderSide(width: 1),
              bottom: BorderSide(width: 1),
            )),
            groupsSpace: 10,

            // add bars
            barGroups: [
              BarChartGroupData(x: 1, barRods: [
                BarChartRodData(toY: 10, width: 15, color: kPinkColor),
              ]),
              BarChartGroupData(x: 2, barRods: [
                BarChartRodData(toY: 9, width: 15, color: kPinkColor),
              ]),
              BarChartGroupData(x: 3, barRods: [
                BarChartRodData(toY: 4, width: 15, color: kPinkColor),
              ]),
              BarChartGroupData(x: 4, barRods: [
                BarChartRodData(toY: 2, width: 15, color: kPinkColor),
              ]),
            ])),
      ),
    );
  }
}
