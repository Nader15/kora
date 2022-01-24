import 'package:get/get.dart';
import 'package:kora/Logic/Controllers/tournaments_controller.dart';

class TournamentsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(TournamentsController());
  }

}