import 'package:flutter/material.dart';
import 'package:sports_bar/widgets/app_navigation.dart';

class ScoresScreen extends StatelessWidget {
  const ScoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
            color: Colors.white,
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                "Live Football Scores, Fixtures & Results",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Center(
                  child: Text(
                    "Premier League",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  border: Border.all(
                    width: 3,
                    color: Color(0xFF66C38E),
                    style: BorderStyle.solid,
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 340,
                    decoration: BoxDecoration(
                      color: Color(0xFF66C38E),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "CHELSEA",
                                style: TextStyle(
                                    letterSpacing: 0.5,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "0 - 2",
                                style: TextStyle(
                                    letterSpacing: 0.5,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "MAN UTD",
                                style: TextStyle(
                                    letterSpacing: 0.5,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "VS",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
