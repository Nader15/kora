import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kora/Routes/routes.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        FirebaseAuth.instance.currentUser != null ||
                GetStorage().read<bool>('isLogIn') == true
            ? Get.offNamed(AppRoutes.mainScreen)
            : Get.offNamed(AppRoutes.login);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "الحريف",
              style: TextStyle(
                // color: Colors.white,
                fontSize: 50,
                fontFamily: "ElMessiri",
              ),
            ),
            Lottie.asset(
                'assets/images/animated-ball.json',width: 100),
          ],
        ),
      ),
      // Stack(
      //   children: [
      //     Image.asset(
      //       'assets/images/app_splash.jpg',
      //       height: MediaQuery.of(context).size.height,
      //       fit: BoxFit.fitHeight,
      //     ),
      //     Center(
      //       child: Text(
      //         "الحريف",
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 50,
      //           fontFamily: "ElMessiri",
      //         ),
      //       ),
      //     ),
      //     Center(
      //       child: Padding(
      //         padding: const EdgeInsets.only(top: 300),
      //         child: CircularProgressIndicator(),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
