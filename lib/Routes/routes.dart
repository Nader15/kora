import 'package:get/get.dart';
import 'package:kora/Logic/Binding/auth_binding.dart';
import 'package:kora/Logic/Binding/main_binding.dart';
import 'package:kora/Logic/Binding/tournaments_binding.dart';
import 'package:kora/View/screens/auth/login_screen.dart';
import 'package:kora/View/screens/auth/matches_screen.dart';
import 'package:kora/View/screens/auth/profile_screen.dart';
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
  ];
}

class Routes {
  static const splash = '/splashScreen';
  static const login = '/loginScreen';
  static const register = '/registerScreen';
  static const mainScreen = '/mainScreen';
  static const matchesScreen = '/matchesScreen';
  static const profileScreen = '/profileScreen';
}
