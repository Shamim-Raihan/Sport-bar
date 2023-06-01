import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sports_bar/repostitory/tournament_repository.dart';

import '../models/sport_model.dart';

class TournamentController extends GetxController {
  var dataloading = false.obs;
  var tournamentList = [].obs;
  var selectedSport = 0.obs;

  var dataloading2 = false.obs;
  var tournamentList2 = [].obs;

  // football
  var footballSportTodaysResponse = SportResponse().obs;
  var footballSportNextDayResponse = SportResponse().obs;
  var footballSportDataList = List<Datum>.empty(growable: true).obs;
  var footballSportNextDataList = List<Datum>.empty(growable: true).obs;

  var SelectedFootballSportDataList = List<Datum>.empty(growable: true).obs;
  var SelectedFootballSportDataList2 = List<Datum>.empty(growable: true).obs;

  //ameriacan football
  var americanSportTodaysResponse = SportResponse().obs;
  var americanSportNextDayResponse = SportResponse().obs;
  var americanSportDataList = List<Datum>.empty(growable: true).obs;
  var americanSportNextDataList = List<Datum>.empty(growable: true).obs;

  //rugby
  var rugbySportTodaysResponse = SportResponse().obs;
  var rugbySportNextDayResponse = SportResponse().obs;
  var rugbySportDataList = List<Datum>.empty(growable: true).obs;
  var rugbySportNextDataList = List<Datum>.empty(growable: true).obs;

  //basketball
  var basketballSportTodaysResponse = SportResponse().obs;
  var basketballSportNextDayResponse = SportResponse().obs;
  var basketballSportDataList = List<Datum>.empty(growable: true).obs;
  var basketballSportNextDataList = List<Datum>.empty(growable: true).obs;

  //basketball
  var baseballSportTodaysResponse = SportResponse().obs;
  var baseballSportNextDayResponse = SportResponse().obs;
  var baseballSportDataList = List<Datum>.empty(growable: true).obs;
  var baseballSportNextDataList = List<Datum>.empty(growable: true).obs;

  void fetchTournamentData(
      {required int category_id, required BuildContext context}) async {
    tournamentList.clear();
    dataloading.value = true;
    tournamentList.value = await TournamentRepository()
        .fetchTournamentData(category_id: category_id);

    tournamentList.refresh();
    if (tournamentList.isEmpty) {
      final snackBar = SnackBar(
        content: const Text('No match found for Today'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

//nextday
  void fetchTournamentNextData(
      {required int category_id, required BuildContext context}) async {
    tournamentList2.clear();
    tournamentList2.value = await TournamentRepository()
        .fetchNextTournamentData(category_id: category_id);
    tournamentList2.refresh();
    dataloading.value = false;
    if (tournamentList2.isEmpty) {
      final snackBar = SnackBar(
        content: const Text('No match found for Tomorrow'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  //baseball----------------------------->>>>>>>>
  void fetchBaseballData(BuildContext context) async {
    dataloading.value = true;
    baseballSportDataList.clear();
    baseballSportNextDataList.clear();
    List<Datum> tempList = [];
    baseballSportTodaysResponse.value =
        (await TournamentRepository().fetchToddaysSportData(sport_id: 64))!;
    tempList.addAll(baseballSportTodaysResponse.value.data!);

    baseballSportDataList.value = baseballSportTodaysResponse.value.data!;

    baseballSportNextDayResponse.value =
        (await TournamentRepository().fetchNextDaySportData(sport_id: 64))!;
    tempList.addAll(baseballSportNextDayResponse.value.data!);
    //baseballSportDataList.value = tempList;
    baseballSportNextDataList.value = baseballSportNextDayResponse.value.data!;

    dataloading.value = false;
    if (baseballSportDataList.isEmpty && baseballSportNextDataList.isNotEmpty) {
      final snackBar = SnackBar(
        content: const Text('No match found for Today'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (baseballSportNextDataList.isEmpty &&
        baseballSportDataList.isNotEmpty) {
      final snackBar = SnackBar(
        content: const Text('No match found for Tomorrow'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (baseballSportNextDataList.isEmpty &&
        baseballSportDataList.isEmpty) {
      final snackBar = SnackBar(
        content: const Text('No match found for Today and Tomorrow'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  //American football----------------------------->>>>>>>>
  void fetchAmericanFootballData(BuildContext context) async {
    dataloading.value = true;
    americanSportDataList.clear();
    List<Datum> tempList = [];
    americanSportTodaysResponse.value =
        (await TournamentRepository().fetchToddaysSportData(sport_id: 63))!;
    tempList.addAll(americanSportTodaysResponse.value.data!);

    americanSportDataList.value = americanSportTodaysResponse.value.data!;

    americanSportNextDayResponse.value =
        (await TournamentRepository().fetchNextDaySportData(sport_id: 63))!;
    tempList.addAll(americanSportNextDayResponse.value.data!);
    //americanSportDataList.value = tempList;
    americanSportNextDataList.value = americanSportNextDayResponse.value.data!;
    dataloading.value = false;

    if (americanSportDataList.isEmpty && americanSportNextDataList.isNotEmpty) {
      final snackBar = SnackBar(
        content: const Text('No match found for Today'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (americanSportNextDataList.isEmpty &&
        americanSportDataList.isNotEmpty) {
      final snackBar = SnackBar(
        content: const Text('No match found for Tomorrow'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (americanSportDataList.isEmpty &&
        americanSportNextDataList.isEmpty) {
      final snackBar = SnackBar(
        content: const Text('No match found for Today and Tomorrow'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  //Rugby---------------------------------------->>>>>>>>
  void fetchRugbyData(BuildContext context) async {
    dataloading.value = true;
    rugbySportDataList.clear();
    List<Datum> tempList = [];
    rugbySportTodaysResponse.value =
        (await TournamentRepository().fetchToddaysSportData(sport_id: 12))!;
    tempList.addAll(rugbySportTodaysResponse.value.data!);

    rugbySportDataList.value = rugbySportTodaysResponse.value.data!;

    rugbySportNextDayResponse.value =
        (await TournamentRepository().fetchNextDaySportData(sport_id: 12))!;
    tempList.addAll(rugbySportNextDayResponse.value.data!);
    //rugbySportDataList.value = tempList;
    rugbySportNextDataList.value = rugbySportNextDayResponse.value.data!;
    dataloading.value = false;
    if (rugbySportDataList.isEmpty && rugbySportNextDataList.isNotEmpty) {
      final snackBar = SnackBar(
        content: const Text('No match found for Today'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (rugbySportNextDataList.isEmpty &&
        rugbySportDataList.isNotEmpty) {
      final snackBar = SnackBar(
        content: const Text('No match found for Tomorrow'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (rugbySportDataList.isEmpty && rugbySportNextDataList.isEmpty) {
      final snackBar = SnackBar(
        content: const Text('No match found for Today and Tomorrow'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  //basketball----------------------------------->>>>>>>>
  void fetchBasketballData(BuildContext context) async {
    dataloading.value = true;
    basketballSportDataList.clear();
    List<Datum> tempList = [];
    basketballSportTodaysResponse.value =
        (await TournamentRepository().fetchToddaysSportData(sport_id: 2))!;
    tempList.addAll(basketballSportTodaysResponse.value.data!);
    basketballSportDataList.value = basketballSportTodaysResponse.value.data!;

    basketballSportNextDayResponse.value =
        (await TournamentRepository().fetchNextDaySportData(sport_id: 2))!;
    tempList.addAll(basketballSportNextDayResponse.value.data!);
    //basketballSportDataList.value = tempList;
    basketballSportNextDataList.value =
        basketballSportNextDayResponse.value.data!;
    dataloading.value = false;

    if (basketballSportDataList.isEmpty &&
        basketballSportNextDataList.isNotEmpty) {
      final snackBar = SnackBar(
        content: const Text('No match found for Today'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (basketballSportNextDataList.isEmpty &&
        basketballSportDataList.isNotEmpty) {
      final snackBar = SnackBar(
        content: const Text('No match found for Tomorrow'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (basketballSportNextDataList.isEmpty &&
        basketballSportDataList.isEmpty) {
      final snackBar = SnackBar(
        content: const Text('No match found for Today and Tomorrow'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  //football----------------------------------->>>>>>>>
  void fetchfootballData(String category, BuildContext context) async {
    dataloading.value = true;
    footballSportDataList.clear();
    SelectedFootballSportDataList.clear();
    List<Datum> tempList = [];
    footballSportTodaysResponse.value =
        (await TournamentRepository().fetchToddaysSportData(sport_id: 1))!;
    tempList.addAll(footballSportTodaysResponse.value.data!);
    footballSportDataList.value = footballSportTodaysResponse.value.data!;

    footballSportNextDayResponse.value =
        (await TournamentRepository().fetchNextDaySportData(sport_id: 1))!;
    tempList.addAll(footballSportNextDayResponse.value.data!);
    //footballSportDataList.value = tempList;
    footballSportNextDataList.value = footballSportNextDayResponse.value.data!;

    await CatFootball(category, footballSportDataList);
    await CatFootball2(category, footballSportNextDataList);
    log('len : ' + SelectedFootballSportDataList.length.toString());
    dataloading.value = false;
    if (footballSportDataList.isEmpty && footballSportNextDataList.isNotEmpty) {
      final snackBar = SnackBar(
        content: const Text('No match found for Today'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (footballSportNextDataList.isEmpty &&
        footballSportDataList.isNotEmpty) {
      final snackBar = SnackBar(
        content: const Text('No match found for Tomorrow'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (footballSportNextDataList.isEmpty &&
        footballSportDataList.isEmpty) {
      final snackBar = SnackBar(
        content: const Text('No match found for Today and Tomorrow'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> CatFootball(String cat, List<Datum> list) async {
    print("Called: ${list.length}");
    SelectedFootballSportDataList.clear();
    for (int i = 0; i < list.length; i++) {
      if (list[i].tournament!.name == cat) {
        print(list[i].tournament!.name);
        SelectedFootballSportDataList.add(list[i]);
      }
    }
  }

  ///for next day
  Future<void> CatFootball2(String cat, List<Datum> list) async {
    print("Called2: ${list.length}");
    SelectedFootballSportDataList2.clear();
    for (int i = 0; i < list.length; i++) {
      if (list[i].tournament!.name == cat) {
        print(list[i].tournament!.name);
        SelectedFootballSportDataList2.add(list[i]);
      }
    }
  }

  String readTimestamp(int timestamp) {
    var now = new DateTime.now();
    var format = new DateFormat('HH:mm a');
    var date = new DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);
    var diff = date.difference(now);
    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else {
      if (diff.inDays == 1) {
        time = diff.inDays.toString() + 'DAY AGO';
      } else {
        time = diff.inDays.toString() + 'DAYS AGO';
      }
    }
    int hour = int.parse(time.substring(0, 2));
    String timeonly = time.substring(0, 5);
    String hourdata = hour > 12 ? (hour - 12).toString() : hour.toString();
    String am_pm = hour > 12 ? "PM" : "AM";
    String newTime = hourdata + ":" + timeonly.substring(3, 5) + " " + am_pm;
    return newTime;
  }

  // String timeformatter(String time){
  //   String formattedtime=time;
  //   String am_pm="";
  //   String hour=time.substring(0,3);
  //   String minute=time.substring(4,6);
  //   int timeNum=int.parse(hour);
  //   int timenumdif=timeNum>12?timeNum-12:timeNum;
  //   am_pm=timeNum>12?"PM":"AM";
  //   String updatedtime=timenumdif.toString();
  //
  //   //formattedtime=updatedtime+":"+minute+" "+am_pm;
  //   return formattedtime;
  // }
}
