import 'package:flutter/material.dart';
import 'package:vcu_2023/custom_widgets/custom_icon_card.dart';
import 'package:vcu_2023/custom_widgets/custom_parent_widget.dart';
import 'package:vcu_2023/globals/common_variables.dart';

class Assignments extends StatefulWidget {
  const Assignments({super.key});

  @override
  State<Assignments> createState() => AssignmentState();
}

class AssignmentState extends State<Assignments>
    with SingleTickerProviderStateMixin {
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
          title: const Text('Assignments'),
          bottom: TabBar(
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const [
              Text('Regular'),
              Text('Entrance'),
            ],
          ),
        ),
        body: CustomParentWidget(
          child: TabBarView(
            controller: tabController,
            children: [
              regAssignments(),
              enAssignments(),
            ],
          ),
        ),
      ),
    );
  }

  Widget regAssignments() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        return const CustomIconCard(
          assetImage: AssetImage('assets/images/phyico.png'),
          assetIcon: null,
          color: kWhiteColor,
          dateText: '',
          headingText: 'Physics',
          subHeadingText: 'Revise Gravitation',
        );
      },
    );
  }

  Widget enAssignments() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        return const CustomIconCard(
          assetImage: AssetImage('assets/images/phyico.png'),
          assetIcon: null,
          color: kWhiteColor,
          dateText: '',
          headingText: 'Physics',
          subHeadingText: 'Revise Gravitation',
        );
      },
    );
  }
}
