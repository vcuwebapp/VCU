import 'package:flutter/material.dart';
import 'package:vcu_2023/custom_widgets/custom_icon_card.dart';
import 'package:vcu_2023/custom_widgets/custom_parent_widget.dart';
import 'package:vcu_2023/custom_widgets/custom_texts.dart';
import 'package:vcu_2023/globals/common_variables.dart';

class Doubts extends StatefulWidget {
  const Doubts({super.key});

  @override
  State<Doubts> createState() => DoubtsState();
}

class DoubtsState extends State<Doubts> with SingleTickerProviderStateMixin {
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
          title: const Text('Doubts'),
          bottom: TabBar(
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const [
              Text('Ask'),
              Text('View'),
            ],
          ),
        ),
        body: CustomParentWidget(
          child: TabBarView(
            controller: tabController,
            children: [
              askDoubt(),
              viewDoubts(),
            ],
          ),
        ),
      ),
    );
  }

  Widget askDoubt() {
    return ListView(
      children: [
        Card(
          child: ListTile(
            title: const HeadingText(text: 'Physics'),
            subtitle: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Enter Doubt',
                      hintStyle: TextStyle(color: kTextColor)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget viewDoubts() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (context, index) {
          return const CustomIconCard(
            status: statusCompleted,
            assetImage: AssetImage('assets/images/phyico.png'),
            assetIcon: null,
            color: kWhiteColor,
            dateText: '04 April, 7.30 pm',
            headingText: 'Physics',
            subHeadingText: 'Revise Gravitation',
          );
        });
  }
}
