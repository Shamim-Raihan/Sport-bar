import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_bar/controllers/tournament_controller.dart';
import 'package:sports_bar/screens/bottomNav_screens/match_annouce.dart';
import 'package:sports_bar/utils/constants.dart';

import '../widgets/app_navigation.dart';

class LeagueFootball extends StatelessWidget {
  LeagueFootball({super.key});
  final TournamentController _tournamentController =
      Get.put(TournamentController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
            children: [
              GestureDetector(
                onTap: () {
                  _tournamentController.fetchTournamentData(
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
              GestureDetector(
                onTap: () {
                  _tournamentController.fetchTournamentData(
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
              GestureDetector(
                onTap: () {
                  _tournamentController.fetchTournamentData(
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
              GestureDetector(
                onTap: () {
                  _tournamentController.fetchTournamentData(
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
    ));
  }
}
