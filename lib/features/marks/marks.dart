import 'package:flutter/material.dart';
import 'package:vcu_2023/custom_widgets/custom_charts.dart';
import 'package:vcu_2023/custom_widgets/custom_icon_card.dart';
import 'package:vcu_2023/custom_widgets/custom_parent_widget.dart';
import 'package:vcu_2023/globals/common_variables.dart';

class Marks extends StatefulWidget {
  const Marks({super.key});

  @override
  State<Marks> createState() => MarksState();
}

class MarksState extends State<Marks> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Marks'),
          bottom: TabBar(
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const [
              Text('Infographics'),
              Text('Tests'),
            ],
          ),
        ),
        body: CustomParentWidget(
          child: TabBarView(
            controller: tabController,
            children: [
              infographics(),
              tests(),
            ],
          ),
        ),
      ),
    );
  }

  Widget infographics() {
    return ListView(
      shrinkWrap: true,
      children: const [
        TestChartCard(
          totalMarks: 100,
          totalTests: 80,
        ),
        BarChartCard(),
      ],
    );
  }

  Widget tests() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (context, index) {
          return const CustomIconCard(
            status: statusCompleted,
            assetImage: null,
            assetIcon: [kPhyColor, 100],
            color: kWhiteColor,
            dateText: '04 April, 7.30 pm',
            headingText: 'Total Marks: 100',
            subHeadingText: 'Gravitation',
          );
        });
  }
}
