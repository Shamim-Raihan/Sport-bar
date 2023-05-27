import 'package:flutter/material.dart';
import 'package:sports_bar/screens/bottomNav_screens/match_annouce.dart';
import 'package:sports_bar/widgets/app_navigation.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: [
            Image(
              image: AssetImage('assets/images/1.png'),
            ),
            InkWell(
              onTap: () => AppNavigation.to(context, MatchAnnounceScreen()),
              child: Image(
                image: AssetImage('assets/images/2.png'),
              ),
            ),
            Image(
              image: AssetImage('assets/images/3.png'),
            ),
            Image(
              image: AssetImage('assets/images/4.png'),
            ),
          ],
        ),
      ),
    ));
  }
}
