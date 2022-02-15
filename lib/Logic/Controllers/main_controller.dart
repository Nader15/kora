import 'package:get/get.dart';
import 'package:kora/View/screens/auth/home_screen.dart';
import 'package:kora/View/screens/auth/matches_screen.dart';
import 'package:kora/View/screens/auth/tournaments_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;
  final tabs = [
    HomeScreen(),
    TournamentsScreen(),
    MatchesScreen(),
  ].obs;
}
