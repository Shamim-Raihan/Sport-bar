import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hive/hive.dart';
import 'package:sports_bar/screens/league_football.dart';
import 'package:sports_bar/screens/profile_view.dart';
import 'package:sports_bar/widgets/app_navigation.dart';
import 'package:sports_bar/widgets/no_match_screen.dart';

import '../auth/login.dart';
import '../controllers/profile_controller.dart';
import 'bottomNav_screens/notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;

  final Box _box = Hive.box("userData");

  Box box = Hive.box("userData");
  @override
  void initState() {
    if (box.isEmpty) {
      box.put("profileData", {
        "userName": "Any",
        "countryName": "United Kingdom",
        "dob": "12/2023",
        "email": "abc@gmail.com",
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: GetBuilder(
            init: ProfileController(),
            builder: (controller) {
              return Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () {
                      showMenu(
                        color: Color(0xFF2E9E5E),
                        context: context,
                        position: RelativeRect.fromLTRB(0, 88, 0, 0),
                        items: [
                          PopupMenuItem(
                            padding: EdgeInsets.zero,
                            child: ListTile(
                              shape: Border(
                                bottom: BorderSide(),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                                AppNavigation.to(
                                  context,
                                  ProfileView(),
                                );
                              },
                              leading: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              title: Text(
                                "Profile",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          PopupMenuItem(
                            padding: EdgeInsets.zero,
                            child: ListTile(
                              shape: Border(
                                bottom: BorderSide(),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                                AppNavigation.to(
                                  context,
                                  NotificationScreen(),
                                );
                              },
                              leading: Icon(
                                Icons.notifications,
                                color: Colors.white,
                              ),
                              title: Text(
                                "Notifications",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          PopupMenuItem(
                            padding: EdgeInsets.zero,
                            child: ListTile(
                              onTap: () {
                                Navigator.pop(context);
                                controller.deleteImage();
                                auth.signOut().then((value) {
                                  Navigator.pushAndRemoveUntil(
                                      (context),
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()),
                                      (route) => false);
                                }).onError((error, stackTrace) {});
                              },
                              leading: Icon(
                                Icons.power_settings_new_rounded,
                                color: Colors.white,
                              ),
                              title: Text(
                                "LogOut",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    icon: Icon(
                      Icons.menu,
                    ),
                  ),
                  title: Image(
                      height: 45,
                      image: AssetImage('assets/images/splashicon.png')),
                  centerTitle: true,
                ),
                body: Container(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      InkWell(
                        onTap: () => showMenu(
                          color: Color(0xFF2E9E5E),
                          context: context,
                          position: RelativeRect.fromLTRB(0, 188, 0, 0),
                          items: [
                            PopupMenuItem(
                              padding: EdgeInsets.zero,
                              child: ListTile(
                                shape: Border(
                                  bottom: BorderSide(),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                  AppNavigation.to(
                                    context,
                                    LeagueFootball(),
                                  );
                                },
                                title: Text(
                                  "LEAGUE FOOTBALL",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem(
                              padding: EdgeInsets.zero,
                              child: ListTile(
                                shape: Border(
                                  bottom: BorderSide(),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                  AppNavigation.to(
                                    context,
                                    NoMatchScreen(),
                                  );
                                },
                                title: Text(
                                  "NATIONAL FOOTBALL",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem(
                              padding: EdgeInsets.zero,
                              child: ListTile(
                                shape: Border(
                                  bottom: BorderSide(),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                  AppNavigation.to(
                                    context,
                                    NoMatchScreen(),
                                  );
                                },
                                title: Text(
                                  "UEFA CHAMPIONS LEAGUE",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            PopupMenuItem(
                              padding: EdgeInsets.zero,
                              child: ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                  AppNavigation.to(
                                    context,
                                    NoMatchScreen(),
                                  );
                                },
                                title: Text(
                                  "EUROPA",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        child: Container(
                          width: 88,
                          decoration: BoxDecoration(
                            color: Color(0xFF1E4365),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  height: 20,
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/football.png'))),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Football",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 88,
                        decoration: BoxDecoration(
                          color: Color(0xFF1E4365),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 20,
                                child: Image(
                                    image: AssetImage(
                                        'assets/images/football2.png'))),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "American \nFootball",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 88,
                        decoration: BoxDecoration(
                          color: Color(0xFF1E4365),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 20,
                                child: Image(
                                    image:
                                        AssetImage('assets/images/rugby.png'))),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Rugby",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 88,
                        decoration: BoxDecoration(
                          color: Color(0xFF1E4365),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 20,
                                child: Image(
                                    image: AssetImage(
                                        'assets/images/basketball.png'))),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Basketball",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 88,
                        decoration: BoxDecoration(
                          color: Color(0xFF1E4365),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 20,
                                child: Image(
                                    image: AssetImage(
                                        'assets/images/baseball.png'))),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Baseball",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
