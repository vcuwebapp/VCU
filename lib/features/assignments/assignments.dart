import 'package:flutter/material.dart';
import 'package:vcu_2023/custom_widgets/custom_icon_card.dart';
import 'package:vcu_2023/custom_widgets/custom_parent_widget.dart';
import 'package:vcu_2023/globals/common_functions.dart';
import 'package:vcu_2023/globals/common_variables.dart';
import 'package:vcu_2023/schema/assignments/assignments_dao.dart';

class Assignments extends StatefulWidget {
  const Assignments({super.key});

  @override
  State<Assignments> createState() => AssignmentState();
}

class AssignmentState extends State<Assignments>
    with SingleTickerProviderStateMixin {
  late Future assignmentsFuture;
  late TabController tabController;
  List<AssignmentsDAO> regAssignmentList = [];
  List<AssignmentsDAO> enAssignmentList = [];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    assignmentsFuture = getAssignments();
  }

  getAssignments() async {
    await dbHelper
        .getSpecificRecords(tableNameAssignments, 'type', 'regular')
        .then((value) {
      regAssignmentList = value as List<AssignmentsDAO>;
    });
    await dbHelper
        .getSpecificRecords(tableNameAssignments, 'type', 'entrance')
        .then((value) {
      enAssignmentList = value as List<AssignmentsDAO>;
    });
    setState(() {});
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
      itemCount: regAssignmentList.length,
      itemBuilder: (context, index) {
        return CustomIconCard(
          assetImage: getSubjectImage(regAssignmentList[index].subject ?? ""),
          assetIcon: null,
          color: kWhiteColor,
          dateText: regAssignmentList[index].dateAssigned ?? "",
          headingText: regAssignmentList[index].subject ?? "",
          subHeadingText: regAssignmentList[index].assignmentName ?? "",
        );
      },
    );
  }

  Widget enAssignments() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: enAssignmentList.length,
      itemBuilder: (context, index) {
        return CustomIconCard(
          assetImage: getSubjectImage(enAssignmentList[index].subject ?? ""),
          assetIcon: null,
          color: kWhiteColor,
          dateText: enAssignmentList[index].dateAssigned ?? "",
          headingText: enAssignmentList[index].subject ?? "",
          subHeadingText: enAssignmentList[index].assignmentName ?? "",
        );
      },
    );
  }
}
