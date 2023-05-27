import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_bar/widgets/app_navigation.dart';

import '../../auth/login.dart';
import '../../controllers/profile_controller.dart';
import '../../controllers/tournament_controller.dart';
import '../../widgets/splash_screen.dart';
import '../chatting_screen.dart';
import '../profile_view.dart';
import 'notification_screen.dart';

class MatchAnnounceScreen extends StatefulWidget {
  MatchAnnounceScreen({super.key});

  @override
  State<MatchAnnounceScreen> createState() => _MatchAnnounceScreenState();
}

class _MatchAnnounceScreenState extends State<MatchAnnounceScreen> {
  final auth = FirebaseAuth.instance;
  final TournamentController _tournamentController =
      Get.put(TournamentController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Obx(() {
          if (_tournamentController.tournamentList.isNotEmpty) {
            return GetBuilder(
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
                  bottomNavigationBar: BottomAppBar(
                      height: 80,
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
                                    color: Colors.black,
                                    fontSize: 15,
                                    letterSpacing: 1),
                              ),
                            ),
                            // Spacer(flex: 2,),
                          ],
                        ),
                      )),
                  body: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height - 116,
                      child: Obx(
                            () =>
                            ListView.builder(
                              physics: BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              itemCount: _tournamentController.tournamentList
                                  .length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () =>
                                        AppNavigation.to(
                                            context, ChattingScreen()),
                                    child: Container(
                                      width: 340,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF66C38E),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    _tournamentController
                                                        .tournamentList[index]
                                                    ['homeTeam']['name']
                                                        .toString(),
                                                    style: TextStyle(
                                                        letterSpacing: 0.5,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight
                                                            .w500),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    _tournamentController
                                                        .tournamentList[index]
                                                    ['time']
                                                        .isNotEmpty
                                                        ? DateTime
                                                        .fromMillisecondsSinceEpoch(
                                                        (_tournamentController
                                                            .tournamentList[
                                                        index]['time']
                                                        [
                                                        'currentPeriodStartTimestamp']) *
                                                            1000)
                                                        .toString()
                                                        .substring(11, 16)
                                                        : 'N/A',
                                                    style: TextStyle(
                                                        letterSpacing: 0.5,
                                                        fontSize: 20,
                                                        fontWeight: FontWeight
                                                            .w500),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    _tournamentController
                                                        .tournamentList[index]
                                                    ['awayTeam']['name']
                                                        .toString(),
                                                    style: TextStyle(
                                                        letterSpacing: 0.5,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight
                                                            .w500),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "GMT+1",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                      ),
                    ),
                  ),
                );
              });
          } else {
            return Container(
              height: MediaQuery.of(context).size.height,
              // color: Colors.red,
              child: SplashScreen(),
            );
          }
        }),
      ),
    );
  }
}
