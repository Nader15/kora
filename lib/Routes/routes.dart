import 'package:get/get.dart';
import 'package:kora/Logic/Binding/auth_binding.dart';
import 'package:kora/Logic/Binding/main_binding.dart';
import 'package:kora/Logic/Binding/tournaments_binding.dart';
import 'package:kora/View/screens/auth/login_screen.dart';
import 'package:kora/View/screens/home/main_screen.dart';
import 'package:kora/View/screens/auth/register_screen.dart';
import 'package:kora/View/screens/splash_screens.dart';

class AppRoutes {
  //initialRoute
  static const splash = Routes.splash;
  static const login = Routes.login;
  static const register = Routes.register;
  static const mainScreen = Routes.mainScreen;

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
  ];
}

class Routes {
  static const splash = '/splashScreen';
  static const login = '/loginScreen';
  static const register = '/registerScreen';
  static const mainScreen = '/mainScreen';
}
