import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../models/sport_model.dart';
import '../models/tournament_model.dart';
import '../utils/constants.dart';

class TournamentRepository {
  Future<List> fetchTournamentData({required int category_id}) async {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);

    List<TournamentData> tournamentData = [];
    try {
      var headers = {
        'X-RapidAPI-Key': Constants.API_KEY,
        'X-RapidAPI-Host': Constants.HOST_URL
      };
      final response = await http.get(
          Uri.parse(
              '${Constants.URL}?date=$formatted&category_id=$category_id'),
          headers: headers);

      if (response.statusCode == 200) {
        List list = (json.decode(response.body))['data'];
        return list;
      } else {
        print(response.reasonPhrase);
      }
    } catch (error) {}
    return [];
  }


  ///nextday
  Future<List> fetchNextTournamentData({required int category_id}) async {
    final DateTime now = DateTime.now().add(Duration(days: 1));
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);

    List<TournamentData> tournamentData = [];
    try {
      var headers = {
        'X-RapidAPI-Key': Constants.API_KEY,
        'X-RapidAPI-Host': Constants.HOST_URL
      };
      final response = await http.get(
          Uri.parse(
              '${Constants.URL}?date=$formatted&category_id=$category_id'),
          headers: headers);

      if (response.statusCode == 200) {
        List list = (json.decode(response.body))['data'];
        return list;
      } else {
        print(response.reasonPhrase);
      }
    } catch (error) {}
    return [];
  }

  Future<SportResponse?>? fetchToddaysSportData({required int sport_id}) async {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    // final String formatted = formatter.format(now);
    final String formatted = "2023-5-11";
    try {
      var headers = {
        'X-RapidAPI-Key': Constants.API_KEY,
        'X-RapidAPI-Host': Constants.HOST_URL
      };
      final response = await http.get(
          Uri.parse(
              '${Constants.SPORT_URL}date?date=$formatted&sport_id=$sport_id'),
          headers: headers);

      if (response.statusCode == 200) {
        var sportResponse = sportResponseFromJson(response.body);
        return sportResponse;
      } else {
        return null;
      }
    } catch (error) {}
    return null;
  }

  Future<SportResponse?>? fetchNextDaySportData({required int sport_id}) async {
    final DateTime now = DateTime.now();
    final nextDay = now.add(Duration(days: 1));
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    // final String formatted = formatter.format(nextDay);
    final String formatted = "2022-9-11";
    try {
      var headers = {
        'X-RapidAPI-Key': Constants.API_KEY,
        'X-RapidAPI-Host': Constants.HOST_URL
      };
      final response = await http.get(
          Uri.parse(
              '${Constants.SPORT_URL}date?date=$formatted&sport_id=$sport_id'),
          headers: headers);

      if (response.statusCode == 200) {
        var sportResponse = sportResponseFromJson(response.body);
        return sportResponse;
      } else {
        return null;
      }
    } catch (error) {}
    return null;
  }
}
