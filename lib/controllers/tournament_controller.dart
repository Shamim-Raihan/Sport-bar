import 'package:get/get.dart';
import 'package:sports_bar/repostitory/tournament_repository.dart';

import '../models/sport_model.dart';

class TournamentController extends GetxController {
  var tournamentList = [].obs;
  var selectedSport = 0.obs;

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
  void fetchBaseballData() async {
    baseballSportDataList.clear();
    List<Datum> tempList = [];
    baseballSportTodaysResponse.value =
        (await TournamentRepository().fetchToddaysSportData(sport_id: 64))!;
    tempList.addAll(baseballSportTodaysResponse.value.data!);

    baseballSportNextDayResponse.value =
        (await TournamentRepository().fetchNextDaySportData(sport_id: 64))!;
    tempList.addAll(baseballSportNextDayResponse.value.data!);
    baseballSportDataList.value = tempList;
  }

  //American football----------------------------->>>>>>>>
  void fetchAmericanFootballData() async {
    americanSportDataList.clear();
    List<Datum> tempList = [];
    americanSportTodaysResponse.value =
        (await TournamentRepository().fetchToddaysSportData(sport_id: 63))!;
    tempList.addAll(americanSportTodaysResponse.value.data!);

    americanSportNextDayResponse.value =
        (await TournamentRepository().fetchNextDaySportData(sport_id: 63))!;
    tempList.addAll(americanSportNextDayResponse.value.data!);
    americanSportDataList.value = tempList;
  }

  //Rugby---------------------------------------->>>>>>>>
  void fetchRugbyData() async {
    rugbySportDataList.clear();
    List<Datum> tempList = [];
    rugbySportTodaysResponse.value =
        (await TournamentRepository().fetchToddaysSportData(sport_id: 12))!;
    tempList.addAll(rugbySportTodaysResponse.value.data!);

    rugbySportNextDayResponse.value =
        (await TournamentRepository().fetchNextDaySportData(sport_id: 12))!;
    tempList.addAll(rugbySportNextDayResponse.value.data!);
    rugbySportDataList.value = tempList;
  }

  //basketball----------------------------------->>>>>>>>
  void fetchBasketballData() async {
    basketballSportDataList.clear();
    List<Datum> tempList = [];
    basketballSportTodaysResponse.value =
        (await TournamentRepository().fetchToddaysSportData(sport_id: 2))!;
    tempList.addAll(basketballSportTodaysResponse.value.data!);

    basketballSportNextDayResponse.value =
        (await TournamentRepository().fetchNextDaySportData(sport_id: 2))!;
    tempList.addAll(basketballSportNextDayResponse.value.data!);
    basketballSportDataList.value = tempList;
  }
}
