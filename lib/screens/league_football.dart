import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import 'package:sports_bar/controllers/tournament_controller.dart';
import 'package:sports_bar/screens/bottomNav_screens/match_annouce.dart';
import 'package:sports_bar/screens/profile_view.dart';
import 'package:sports_bar/utils/constants.dart';

import '../auth/login.dart';
import '../widgets/app_navigation.dart';
import 'bottomNav_screens/notification_screen.dart';

class LeagueFootball extends StatefulWidget {
  LeagueFootball({super.key});

  @override
  State<LeagueFootball> createState() => _LeagueFootballState();
}

class _LeagueFootballState extends State<LeagueFootball> {
  final auth = FirebaseAuth.instance;
  final TournamentController _tournamentController =
      Get.put(TournamentController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder(
          init: ProfileController(),
          builder: (controller){
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
      bottomNavigationBar: BottomAppBar(
            elevation: 6,
            // BottomAppBar content
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 10, left: 30, right: 20, bottom: 10),
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
          padding: const EdgeInsets.all(4.0),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(height: 10.h,),
                GestureDetector(
                  onTap: () {
                    _tournamentController.fetchTournamentData(
                        category_id: Constants.premier_legue);
                    _tournamentController.fetchTournamentNextData(
                        category_id: Constants.premier_legue);
                    AppNavigation.to(context, MatchAnnounceScreen());
                  },
                  child: Container(
                    width: 250,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color(0xFFF508C1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "PREMIER",
                            style: TextStyle(
                                letterSpacing: 1,
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "LEAGUE",
                            style: TextStyle(
                                letterSpacing: 1,
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),
                GestureDetector(
                  onTap: () {
                    _tournamentController.fetchTournamentData(
                        category_id: Constants.la_liga);
                    _tournamentController.fetchTournamentNextData(
                        category_id: Constants.la_liga);
                    AppNavigation.to(context, MatchAnnounceScreen());
                  },
                  child: Container(
                    width: 250,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color(0xFF184282),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "LA LIGA",
                        style: TextStyle(
                            letterSpacing: 1,
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),
                GestureDetector(
                  onTap: () {
                    _tournamentController.fetchTournamentData(
                        category_id: Constants.bundesliga);
                    _tournamentController.fetchTournamentNextData(
                        category_id: Constants.bundesliga);
                    AppNavigation.to(context, MatchAnnounceScreen());
                  },
                  child: Container(
                    width: 250,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color(0xFFE90310),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "BUNDESLIGA",
                        style: TextStyle(
                            letterSpacing: 1,
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),
                GestureDetector(
                  onTap: () {
                    _tournamentController.fetchTournamentData(
                        category_id: Constants.serie_a);
                    _tournamentController.fetchTournamentNextData(
                        category_id: Constants.serie_a);
                    AppNavigation.to(context, MatchAnnounceScreen());
                  },
                  child: Container(
                    width: 250,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color(0xFF212621),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "SERIE A",
                        style: TextStyle(
                            letterSpacing: 1,
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
   }),
  );
  }
}
