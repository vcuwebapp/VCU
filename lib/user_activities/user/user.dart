import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:vcu_2023/custom_widgets/custom_parent_widget.dart';
import 'package:vcu_2023/custom_widgets/custom_texts.dart';
import 'package:vcu_2023/globals/common_variables.dart';
import 'package:vcu_2023/user_activities/logout/logout_functions.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  UserProfilePage createState() => UserProfilePage();
}

class UserProfilePage extends State<UserProfile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserProfile'),
      ),
      body: CustomParentWidget(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Icon(Icons.person, size: 100.dp, color: kTextLightColor),
                  detailText('Name', 'Tejas Shelke'),
                  detailText('Batch', 'XI Regular'),
                  detailText('Fees Paid', '20,000'),
                  detailText('Fees Remaining', '10,000'),
                  detailText('Due Date', '01 January 2024'),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              logoutUser(context);
            },
            child: const Text('Sign Out'),
          ),
        ],
      )),
    );
  }
}
