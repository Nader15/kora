import 'package:get/get.dart';
import 'package:kora/Logic/Binding/auth_binding.dart';
import 'package:kora/Logic/Binding/main_binding.dart';
import 'package:kora/Logic/Binding/tournaments_binding.dart';
import 'package:kora/View/screens/auth/create_match_step1_screen.dart';
import 'package:kora/View/screens/auth/create_match_step2_screen.dart';
import 'package:kora/View/screens/auth/login_screen.dart';
import 'package:kora/View/screens/auth/matches_screen.dart';
import 'package:kora/View/screens/auth/profile_screen.dart';
import 'package:kora/View/screens/auth/team_lineup_screen.dart';
import 'package:kora/View/screens/auth/team_screen.dart';
import 'package:kora/View/screens/auth/tournament_teams_screen.dart';
import 'package:kora/View/screens/auth/uncomplete_matches_screen.dart';
import 'package:kora/View/screens/home/main_screen.dart';
import 'package:kora/View/screens/auth/register_screen.dart';
import 'package:kora/View/screens/splash_screens.dart';

class AppRoutes {
  //initialRoute
  static const splash = Routes.splash;
  static const login = Routes.login;
  static const register = Routes.register;
  static const mainScreen = Routes.mainScreen;
  static const matchesScreen = Routes.matchesScreen;
  static const profileScreen = Routes.profileScreen;
  static const teamScreen = Routes.teamScreen;
  static const teamLineupScreen = Routes.teamLineupScreen;
  static const tournamentTeamScreen = Routes.tournamentTeamScreen;
  static const unCompleteMatchesScreen = Routes.unCompleteMatchesScreen;
  static const createMatchStep1Screen = Routes.createMatchStep1Screen;
  static const createMatchStep2Screen = Routes.createMatchStep2Screen;

  //getPages
  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.register,
      page: () => RegisterScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        TournamentsBinding(),
      ],
    ),
    GetPage(
      name: Routes.matchesScreen,
      page: () => MatchesScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.profileScreen,
      page: () => ProfileScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.teamScreen,
      page: () => TeamScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.teamLineupScreen,
      page: () => TeamLineupScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.tournamentTeamScreen,
      page: () => TournamentTeamScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.unCompleteMatchesScreen,
      page: () => UnCompleteMatchesScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.createMatchStep1Screen,
      page: () => CreateMatchStep1Screen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.createMatchStep2Screen,
      page: () => CreateMatchStep2Screen(),
      binding: AuthBinding(),
    ),
  ];
}

class Routes {
  static const splash = '/splashScreen';
  static const login = '/loginScreen';
  static const register = '/registerScreen';
  static const mainScreen = '/mainScreen';
  static const matchesScreen = '/matchesScreen';
  static const profileScreen = '/profileScreen';
  static const teamScreen = '/teamScreen';
  static const teamLineupScreen = '/teamLineupScreen';
  static const tournamentTeamScreen = '/tournamentTeamScreen';
  static const unCompleteMatchesScreen = '/unCompleteMatchesScreen';
  static const createMatchStep1Screen = '/createMatchStep1Screen';
  static const createMatchStep2Screen = '/createMatchStep2Screen';
}
