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

  // football
  var footballSportTodaysResponse = SportResponse().obs;
  var footballSportNextDayResponse = SportResponse().obs;
  var footballSportDataList = List<Datum>.empty(growable: true).obs;

  var SelectedFootballSportDataList = List<Datum>.empty(growable: true).obs;

  //ameriacan football
  var americanSportTodaysResponse = SportResponse().obs;
  var americanSportNextDayResponse = SportResponse().obs;
  var americanSportDataList = List<Datum>.empty(growable: true).obs;

  //rugby
  var rugbySportTodaysResponse = SportResponse().obs;
  var rugbySportNextDayResponse = SportResponse().obs;
  var rugbySportDataList = List<Datum>.empty(growable: true).obs;

  //basketball
  var basketballSportTodaysResponse = SportResponse().obs;
  var basketballSportNextDayResponse = SportResponse().obs;
  var basketballSportDataList = List<Datum>.empty(growable: true).obs;

  //basketball
  var baseballSportTodaysResponse = SportResponse().obs;
  var baseballSportNextDayResponse = SportResponse().obs;
  var baseballSportDataList = List<Datum>.empty(growable: true).obs;

  void fetchTournamentData({required int category_id}) async {
    tournamentList.clear();
    tournamentList.value = await TournamentRepository()
        .fetchTournamentData(category_id: category_id);
    tournamentList.refresh();
  }

  //baseball----------------------------->>>>>>>>
  void fetchBaseballData( BuildContext context) async {
    dataloading.value = true;
    baseballSportDataList.clear();
    List<Datum> tempList = [];
    baseballSportTodaysResponse.value =
        (await TournamentRepository().fetchToddaysSportData(sport_id: 64))!;
    tempList.addAll(baseballSportTodaysResponse.value.data!);

    baseballSportNextDayResponse.value =
        (await TournamentRepository().fetchNextDaySportData(sport_id: 64))!;
    tempList.addAll(baseballSportNextDayResponse.value.data!);
    baseballSportDataList.value = tempList;
    dataloading.value = false;
    if (baseballSportDataList.isEmpty) {
      final snackBar = SnackBar(
        content: const Text('No match found for Today and Tomorrow'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  //American football----------------------------->>>>>>>>
  void fetchAmericanFootballData( BuildContext context) async {
    dataloading.value = true;
    americanSportDataList.clear();
    List<Datum> tempList = [];
    americanSportTodaysResponse.value =
        (await TournamentRepository().fetchToddaysSportData(sport_id: 63))!;
    tempList.addAll(americanSportTodaysResponse.value.data!);

    americanSportNextDayResponse.value =
        (await TournamentRepository().fetchNextDaySportData(sport_id: 63))!;
    tempList.addAll(americanSportNextDayResponse.value.data!);
    americanSportDataList.value = tempList;
    dataloading.value = false;
    if (americanSportDataList.isEmpty) {
      final snackBar = SnackBar(
        content: const Text('No match found for Today and Tomorrow'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  //Rugby---------------------------------------->>>>>>>>
  void fetchRugbyData( BuildContext context) async {
    dataloading.value = true;
    rugbySportDataList.clear();
    List<Datum> tempList = [];
    rugbySportTodaysResponse.value =
        (await TournamentRepository().fetchToddaysSportData(sport_id: 12))!;
    tempList.addAll(rugbySportTodaysResponse.value.data!);

    rugbySportNextDayResponse.value =
        (await TournamentRepository().fetchNextDaySportData(sport_id: 12))!;
    tempList.addAll(rugbySportNextDayResponse.value.data!);
    rugbySportDataList.value = tempList;
    dataloading.value = false;
    if (rugbySportDataList.isEmpty) {
      final snackBar = SnackBar(
        content: const Text('No match found for Today and Tomorrow'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  //basketball----------------------------------->>>>>>>>
  void fetchBasketballData( BuildContext context) async {
    dataloading.value = true;
    basketballSportDataList.clear();
    List<Datum> tempList = [];
    basketballSportTodaysResponse.value =
        (await TournamentRepository().fetchToddaysSportData(sport_id: 2))!;
    tempList.addAll(basketballSportTodaysResponse.value.data!);

    basketballSportNextDayResponse.value =
        (await TournamentRepository().fetchNextDaySportData(sport_id: 2))!;
    tempList.addAll(basketballSportNextDayResponse.value.data!);
    basketballSportDataList.value = tempList;
    dataloading.value = false;
    if (basketballSportDataList.isEmpty) {
      final snackBar = SnackBar(
        content: const Text('No match found for Today and Tomorrow'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
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

    footballSportNextDayResponse.value =
        (await TournamentRepository().fetchNextDaySportData(sport_id: 1))!;
    tempList.addAll(footballSportNextDayResponse.value.data!);
    footballSportDataList.value = tempList;
    await CatFootball(category, footballSportDataList);
    log('len : ' + SelectedFootballSportDataList.length.toString());
    dataloading.value = false;
    if (SelectedFootballSportDataList.isEmpty) {
      final snackBar = SnackBar(
        content: const Text('No match found for Today and Tomorrow'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
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

    return time;
  }
}
