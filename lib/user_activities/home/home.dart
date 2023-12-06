import 'package:flutter/material.dart';
import 'package:vcu_2023/custom_widgets/feature_icon.dart';
import 'package:vcu_2023/globals/common_variables.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeScreen createState() => HomeScreen();
}

class HomeScreen extends State<Home> {
  String username = 'Tejas Shelke';
  String standard = 'XII Regular';

  void iniState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: kDarkPurpleColor),
            text: username,
            children: [
              const TextSpan(
                text: '\n',
              ),
              TextSpan(
                text: standard,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                ///TODO: create notification page and navigate to notification screen.
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Card(
              child: Image(
                  image: AssetImage('assets/images/welcome_graphics.jpg')),
            ),
            Card(
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: featureList.length,
                  itemBuilder: (context, index) {
                    return CustomFeatureIcon(
                      featureName:
                          featureList.entries.elementAt(index).value[0],
                      featureIcon:
                          featureList.entries.elementAt(index).value[2],
                      iconColor: featureList.entries.elementAt(index).value[1],
                      onTap: () {
                        ///TODO: make chnages for dynamic fields.
                      },
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
