import 'package:get/get.dart';
import 'package:sports_bar/repostitory/tournament_repository.dart';

class TournamentController extends GetxController {
  var tournamentList = [].obs;
  void fetchTournamentData({required int category_id}) async {
    tournamentList.clear();
    tournamentList.value = await TournamentRepository()
        .fetchTournamentData(category_id: category_id);
    tournamentList.refresh();
  }
}
