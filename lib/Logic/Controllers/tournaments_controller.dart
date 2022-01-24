import 'package:get/get.dart';
import 'package:kora/Models/tournaments_model.dart';
import 'package:kora/Services/tournaments_services.dart';

class TournamentsController extends GetxController {
  var tournamentsList = <TournamentsModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit(){
    super.onInit();
    getTournaments();
  }

  getTournaments() async {
    var tournaments = await TournamentsServices.getTournaments();
    try {
      isLoading(true);
      if (tournaments.isNotEmpty){
        tournamentsList.addAll(tournaments);
      }
    } finally {
      isLoading(false);
    }
  }
}
