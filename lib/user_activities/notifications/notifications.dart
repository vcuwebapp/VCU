import 'package:flutter/material.dart';
import 'package:vcu_2023/custom_widgets/custom_icon_card.dart';
import 'package:vcu_2023/custom_widgets/custom_parent_widget.dart';
import 'package:vcu_2023/globals/common_variables.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  NotificationsPage createState() => NotificationsPage();
}

class NotificationsPage extends State<Notifications> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: CustomParentWidget(child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
              return const Padding(
                padding:  EdgeInsets.symmetric(vertical: 4.0),
                child:  CustomIconCard(assetImage: AssetImage("assets/images/notiico.png"), color: kWhiteColor, dateText: '04 April, 7:30pm', headingText: 'Maths Test', subHeadingText: '80/80',),
              );
            }
          ),
    ),
    );
  }
}
