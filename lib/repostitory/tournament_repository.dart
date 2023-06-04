import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sports_bar/models/media_model.dart';
import 'package:sports_bar/models/unique_tournaments_model.dart';

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
    final String formatted = formatter.format(now);
    // final String formatted = "2023-5-11";
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
     final String formatted = formatter.format(nextDay);
    // final String formatted = "2022-9-11";
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



  ///fetchalltournamentcatfornews

  Future<MediaCatModel?>? fetchTournamentNewsData() async {
    try {
      var headers = {
        'X-RapidAPI-Key': Constants.API_KEY,
        'X-RapidAPI-Host': Constants.HOST_URL
      };
      final response = await http.get(
          Uri.parse(
              'https://sofasport.p.rapidapi.com/v1/unique-tournaments-top?locale=EN'),
          headers: headers);

      if (response.statusCode == 200) {
        var Response = mediacatFromJson(response.body);
        print(response.body);
        return Response;
      } else {
        return null;
      }
    } catch (error) {}
    return null;
  }

  ///fetchnews

  Future<MediaModel?>? fetchNewsData(String id) async {
    print("FetchNews hit");
    print(id);
    try {
      var headers = {
        'X-RapidAPI-Key': Constants.API_KEY,
        'X-RapidAPI-Host': Constants.HOST_URL
      };
      final response = await http.get(
          Uri.parse(
              'https://sofasport.p.rapidapi.com/v1/unique-tournaments/media?unique_tournament_id=$id'),
          headers: headers);
      var Response = mediamodelFromJson(response.body);
      print(response.body);
      return Response;
      if (response.statusCode == 200) {
        var Response = mediamodelFromJson(response.body);
        print(response.body);
        return Response;
      } else {
        return null;
      }
    } catch (error) {}
    return null;
  }
}
