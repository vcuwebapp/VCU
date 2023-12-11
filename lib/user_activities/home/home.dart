import 'package:flutter/material.dart';
import 'package:vcu_2023/custom_widgets/feature_icon.dart';
import 'package:vcu_2023/globals/common_variables.dart';
import 'package:vcu_2023/user_activities/notifications/notifications.dart';

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
    return PopScope(
      canPop: false,
      child: Scaffold(
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Notifications()));
                }),
          ],
        ),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const Card(
                child: Image(
                    image: AssetImage('assets/images/welcome_graphics.jpg')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: cardFeatureList.length,
                  itemBuilder: (context, index) {
                    return CustomFeatureIcon(
                      featureName: cardFeatureList.entries
                          .elementAt(index)
                          .value
                          .elementAt(0),
                      featureIcon: cardFeatureList.entries
                          .elementAt(index)
                          .value
                          .elementAt(3),
                      iconColor: cardFeatureList.entries
                          .elementAt(index)
                          .value
                          .elementAt(2),
                      onTap: () {
                        Navigator.pushNamed(
                            context,
                            cardFeatureList.entries
                                .elementAt(index)
                                .value
                                .elementAt(1));
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 8,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var feature in navigationFeatureList.entries)
                BottomBarFeature(
                  featureName: feature.value.elementAt(0),
                  featureIcon: feature.value.elementAt(3),
                  iconColor: feature.value.elementAt(2),
                  onTap: () {
                    Navigator.pushNamed(context, feature.value.elementAt(1));
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
