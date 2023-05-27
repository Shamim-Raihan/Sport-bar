import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_bar/widgets/app_navigation.dart';

import '../../controllers/tournament_controller.dart';
import '../../widgets/splash_screen.dart';
import '../chatting_screen.dart';

class MatchAnnounceScreen extends StatelessWidget {
  MatchAnnounceScreen({super.key});
  final TournamentController _tournamentController =
      Get.put(TournamentController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Obx(() {
          if (_tournamentController.tournamentList.isNotEmpty) {
            return Scaffold(
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
                  height: MediaQuery.of(context).size.height - 116,
                  child: Obx(
                    () => ListView.builder(
                      physics: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: _tournamentController.tournamentList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () =>
                                AppNavigation.to(context, ChattingScreen()),
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
                                                fontWeight: FontWeight.w500),
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
                                                ? DateTime.fromMillisecondsSinceEpoch(
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
                                                fontWeight: FontWeight.w500),
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
                                                fontWeight: FontWeight.w500),
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
