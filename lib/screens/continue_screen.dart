import 'package:flutter/material.dart';
import 'package:sports_bar/screens/edit_profile.dart';
import 'package:sports_bar/screens/profile_view.dart';
import 'package:sports_bar/widgets/round_button.dart';

class ContinueScreen extends StatelessWidget {
  const ContinueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RoundButton(
                title: 'Continue',
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfile()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
