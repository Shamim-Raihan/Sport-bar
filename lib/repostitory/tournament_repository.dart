import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

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
        List l = (json.decode(response.body))['data'];
        log(l[0]['time']['currentPeriodStartTimestamp'].toString());
        return l;
      } else {
        print(response.reasonPhrase);
      }
    } catch (error) {}
    return [];
  }

  fetchTodaysMatchByTournanment({required int sport_id}) async {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);
    try {
      var headers = {
        'X-RapidAPI-Key': Constants.API_KEY,
        'X-RapidAPI-Host': Constants.HOST_URL
      };
      final response = await http.get(
          Uri.parse('${Constants.URL}?date=$formatted&sport_id=$sport_id'),
          headers: headers);

      if (response.statusCode == 200) {
        List l = (json.decode(response.body))['data'];
        return l;
      } else {
        print(response.reasonPhrase);
      }
    } catch (error) {}
  }
}
