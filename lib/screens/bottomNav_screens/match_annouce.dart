import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_bar/widgets/app_navigation.dart';
import 'package:sports_bar/widgets/shimmer_helper.dart';

import '../../controllers/tournament_controller.dart';
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
        child: Scaffold(
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
          body: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_tournamentController.selectedSport.value == 0) {
      return _buildFootballView(context);
    } else if (_tournamentController.selectedSport.value == 1) {
      return _buildAmericanFootbalView(context);
    } else if (_tournamentController.selectedSport.value == 2) {
      return _buildRugbyView(context);
    } else if (_tournamentController.selectedSport.value == 3) {
      return _buildBasketballView(context);
    } else if (_tournamentController.selectedSport.value == 4) {
      return _buildAllFootbalView(context);
    } else {
      return _buildBaseballView(context);
    }
  }

  Widget _buildBaseballView(BuildContext context) {
    return Obx(
      () => _tournamentController.dataloading.value==false?
          _tournamentController.baseballSportDataList.isEmpty?
              Container():
           Container(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height - 116,
                  child: Obx(
                    () => ListView.builder(
                      physics: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount:
                          _tournamentController.baseballSportDataList.length,
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
                                                .baseballSportDataList[index]
                                                .homeTeam!
                                                .name!,
                                            style: TextStyle(
                                                letterSpacing: 0.5,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            children: [
                                              Text(
                                                _tournamentController
                                                            .baseballSportDataList[
                                                                index]
                                                            .time!
                                                            .currentPeriodStartTimestamp !=
                                                        null
                                                    ? DateTime.fromMillisecondsSinceEpoch(
                                                            (_tournamentController
                                                                    .baseballSportDataList[
                                                                        index]
                                                                    .time!
                                                                    .currentPeriodStartTimestamp!) *
                                                                1000)
                                                        .toString()
                                                        .substring(0, 11)
                                                    : 'N/A',
                                                style: TextStyle(
                                                    letterSpacing: 0.5,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                _tournamentController
                                                            .baseballSportDataList[
                                                                index]
                                                            .time!
                                                            .currentPeriodStartTimestamp !=
                                                        null
                                                    ? DateTime.fromMillisecondsSinceEpoch(
                                                            (_tournamentController
                                                                    .baseballSportDataList[
                                                                        index]
                                                                    .time!
                                                                    .currentPeriodStartTimestamp!) *
                                                                1000)
                                                        .toString()
                                                        .substring(11, 16)
                                                    : 'N/A',
                                                style: TextStyle(
                                                    letterSpacing: 0.5,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            _tournamentController
                                                .baseballSportDataList[index]
                                                .awayTeam!
                                                .name!,
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
            )
          : Container(
              child: ListView.builder(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShimmerHelper().buildBasicShimmer(
                      height: 80,
                      width: 350,
                    ),
                  );
                },
              ),
            ),
    );
  }

  Widget _buildBasketballView(BuildContext context) {
    return Obx(
      () => _tournamentController.dataloading.value==false?
          _tournamentController.basketballSportDataList.isEmpty?
              Container():
           Container(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height - 116,
                  child: Obx(
                    () => ListView.builder(
                      physics: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount:
                          _tournamentController.basketballSportDataList.length,
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
                                                .basketballSportDataList[index]
                                                .homeTeam!
                                                .name!,
                                            style: TextStyle(
                                                letterSpacing: 0.5,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            children: [
                                              Text(
                                                _tournamentController
                                                            .basketballSportDataList[
                                                                index]
                                                            .time!
                                                            .currentPeriodStartTimestamp !=
                                                        null
                                                    ? DateTime.fromMillisecondsSinceEpoch(
                                                            (_tournamentController
                                                                    .basketballSportDataList[
                                                                        index]
                                                                    .time!
                                                                    .currentPeriodStartTimestamp!) *
                                                                1000)
                                                        .toString()
                                                        .substring(0, 11)
                                                    : 'N/A',
                                                style: TextStyle(
                                                    letterSpacing: 0.5,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                _tournamentController
                                                            .basketballSportDataList[
                                                                index]
                                                            .time!
                                                            .currentPeriodStartTimestamp !=
                                                        null
                                                    ? DateTime.fromMillisecondsSinceEpoch(
                                                            (_tournamentController
                                                                    .basketballSportDataList[
                                                                        index]
                                                                    .time!
                                                                    .currentPeriodStartTimestamp!) *
                                                                1000)
                                                        .toString()
                                                        .substring(11, 16)
                                                    : 'N/A',
                                                style: TextStyle(
                                                    letterSpacing: 0.5,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            _tournamentController
                                                .basketballSportDataList[index]
                                                .awayTeam!
                                                .name!,
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
            )
          : Container(
              child: ListView.builder(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShimmerHelper().buildBasicShimmer(
                      height: 80,
                      width: 350,
                    ),
                  );
                },
              ),
            ),
    );
  }

  Widget _buildRugbyView(BuildContext context) {
    return Obx(
      () => _tournamentController.dataloading.value==false?
          _tournamentController.rugbySportDataList.isEmpty?
              Container():
          Container(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height - 116,
                  child: Obx(
                    () => ListView.builder(
                      physics: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount:
                          _tournamentController.rugbySportDataList.length,
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
                                                .rugbySportDataList[index]
                                                .homeTeam!
                                                .name!,
                                            style: TextStyle(
                                                letterSpacing: 0.5,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            children: [
                                              Text(
                                                _tournamentController
                                                            .rugbySportDataList[
                                                                index]
                                                            .time!
                                                            .currentPeriodStartTimestamp !=
                                                        null
                                                    ? DateTime.fromMillisecondsSinceEpoch(
                                                            (_tournamentController
                                                                    .rugbySportDataList[
                                                                        index]
                                                                    .time!
                                                                    .currentPeriodStartTimestamp!) *
                                                                1000)
                                                        .toString()
                                                        .substring(0, 11)
                                                    : 'N/A',
                                                style: TextStyle(
                                                    letterSpacing: 0.5,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                _tournamentController
                                                            .rugbySportDataList[
                                                                index]
                                                            .time!
                                                            .currentPeriodStartTimestamp !=
                                                        null
                                                    ? DateTime.fromMillisecondsSinceEpoch(
                                                            (_tournamentController
                                                                    .rugbySportDataList[
                                                                        index]
                                                                    .time!
                                                                    .currentPeriodStartTimestamp!) *
                                                                1000)
                                                        .toString()
                                                        .substring(11, 16)
                                                    : 'N/A',
                                                style: TextStyle(
                                                    letterSpacing: 0.5,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            _tournamentController
                                                .rugbySportDataList[index]
                                                .awayTeam!
                                                .name!,
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
            )
          : Container(
              child: ListView.builder(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShimmerHelper().buildBasicShimmer(
                      height: 80,
                      width: 350,
                    ),
                  );
                },
              ),
            ),
    );
  }

  Widget _buildAmericanFootbalView(BuildContext context) {
    return Obx(
      () => _tournamentController.dataloading.value==false?
          _tournamentController.americanSportDataList.isEmpty?
              Container():
           Container(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height - 116,
                  child: Obx(
                    () => ListView.builder(
                      physics: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount:
                          _tournamentController.americanSportDataList.length,
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
                                                .americanSportDataList[index]
                                                .homeTeam!
                                                .name!,
                                            style: TextStyle(
                                                letterSpacing: 0.5,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            children: [
                                              Text(
                                                _tournamentController
                                                            .americanSportDataList[
                                                                index]
                                                            .time!
                                                            .currentPeriodStartTimestamp !=
                                                        null
                                                    ? DateTime.fromMillisecondsSinceEpoch(
                                                            (_tournamentController
                                                                    .americanSportDataList[
                                                                        index]
                                                                    .time!
                                                                    .currentPeriodStartTimestamp!) *
                                                                1000)
                                                        .toString()
                                                        .substring(0, 11)
                                                    : 'N/A',
                                                style: TextStyle(
                                                    letterSpacing: 0.5,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                _tournamentController
                                                            .americanSportDataList[
                                                                index]
                                                            .time!
                                                            .currentPeriodStartTimestamp !=
                                                        null
                                                    ? DateTime.fromMillisecondsSinceEpoch(
                                                            (_tournamentController
                                                                    .americanSportDataList[
                                                                        index]
                                                                    .time!
                                                                    .currentPeriodStartTimestamp!) *
                                                                1000)
                                                        .toString()
                                                        .substring(11, 16)
                                                    : 'N/A',
                                                style: TextStyle(
                                                    letterSpacing: 0.5,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            _tournamentController
                                                .americanSportDataList[index]
                                                .awayTeam!
                                                .name!,
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
            )
          : Container(
              child: ListView.builder(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShimmerHelper().buildBasicShimmer(
                      height: 80,
                      width: 350,
                    ),
                  );
                },
              ),
            ),
    );
  }

  Widget _buildFootballView(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height - 116,
        child: Obx(
          () => ListView.builder(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemCount: _tournamentController.tournamentList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => AppNavigation.to(context, ChattingScreen()),
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
                                  _tournamentController.tournamentList[index]
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
                                child: Column(
                                  children: [
                                    Text(
                                      _tournamentController
                                                  .tournamentList[index]['time']['currentPeriodStartTimestamp'] !=
                                              null
                                          ? DateTime.fromMillisecondsSinceEpoch(
                                                  (_tournamentController
                                                          .tournamentList[
                                                  index]['time'][
                                                  'currentPeriodStartTimestamp']) *
                                                      1000)
                                              .toString()
                                              .substring(0, 11)
                                          : 'N/A',
                                      style: TextStyle(
                                          letterSpacing: 0.5,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      _tournamentController
                                              .tournamentList[index]['time']
                                              .isNotEmpty
                                          ? DateTime.fromMillisecondsSinceEpoch(
                                                  (_tournamentController
                                                                  .tournamentList[
                                                              index]['time'][
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
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  _tournamentController.tournamentList[index]
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
                                fontSize: 13, fontWeight: FontWeight.w500),
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
    );
  }

  Widget _buildAllFootbalView(BuildContext context) {
    return Obx(() {
      if (_tournamentController.dataloading.value == false) {
        return _tournamentController.SelectedFootballSportDataList.isEmpty
            ? Container()
            : Container(
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height - 116,
                    child: Obx(
                      () => ListView.builder(
                        physics: BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount: _tournamentController
                            .SelectedFootballSportDataList.length,
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
                                                  .SelectedFootballSportDataList[
                                                      index]
                                                  .homeTeam!
                                                  .name!,
                                              style: TextStyle(
                                                  letterSpacing: 0.5,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              children: [
                                                Text(
                                                  _tournamentController
                                                              .SelectedFootballSportDataList[
                                                                  index]
                                                              .time!
                                                              .currentPeriodStartTimestamp !=
                                                          null
                                                      ? DateTime.fromMillisecondsSinceEpoch(
                                                              (_tournamentController
                                                                      .SelectedFootballSportDataList[
                                                                          index]
                                                                      .time!
                                                                      .currentPeriodStartTimestamp!) *
                                                                  1000)
                                                          .toString()
                                                          .substring(0, 11)
                                                      : 'N/A',
                                                  style: TextStyle(
                                                      letterSpacing: 0.5,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  textAlign: TextAlign.center,
                                                ),
                                                Text(
                                                  _tournamentController
                                                              .SelectedFootballSportDataList[
                                                                  index]
                                                              .time!
                                                              .currentPeriodStartTimestamp !=
                                                          null
                                                      ? DateTime.fromMillisecondsSinceEpoch(
                                                              (_tournamentController
                                                                      .SelectedFootballSportDataList[
                                                                          index]
                                                                      .time!
                                                                      .currentPeriodStartTimestamp!) *
                                                                  1000)
                                                          .toString()
                                                          .substring(11, 16)
                                                      : 'N/A',
                                                  style: TextStyle(
                                                      letterSpacing: 0.5,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              _tournamentController
                                                  .SelectedFootballSportDataList[
                                                      index]
                                                  .awayTeam!
                                                  .name!,
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
          child: ListView.builder(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemCount: 15,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ShimmerHelper().buildBasicShimmer(
                  height: 80,
                  width: 350,
                ),
              );
            },
          ),
        );
      }
    });
  }
}
