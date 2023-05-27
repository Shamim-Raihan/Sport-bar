import 'package:flutter/material.dart';

import 'app_navigation.dart';

class NoMatchScreen extends StatelessWidget {
  const NoMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
            elevation: 6,
            // BottomAppBar content
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 30, right: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      AppNavigation.pop(context);
                    },
                    child: Text(
                      '<<Back',
                      style: TextStyle(
                          color: Colors.black, fontSize: 15, letterSpacing: 1),
                    ),
                  ),
                  // Spacer(flex: 2,),
                ],
              ),
            )),
        body: Padding(
            padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
            child: Text(
              "Sorry! No major international game listed for today",
              style: TextStyle(fontSize: 17),
            )),
      ),
    );
  }
}
