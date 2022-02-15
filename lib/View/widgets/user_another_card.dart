import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kora/Logic/Controllers/auth_controller.dart';
import 'package:kora/Utils/colors.dart';

class UserAnotherCard extends StatelessWidget {
  UserAnotherCard({Key key}) : super(key: key);
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        // alignment: AlignmentDirectional.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/player_card.png",
              height: MediaQuery.of(context).size.height / 2,
            ),
          ),
          Positioned(
            top: 75,
            bottom: 190,
            right: 100,
            left: 100,
            child: Image.network(
              "${authController.displayUserPhoto}",
              fit: BoxFit.fitWidth,
              width: 50,
              scale: 0.2,
            ),
          ),
          Positioned(
            top: 215,
            right: 0,
            left: 0,
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width/2.5,
                child: Column(
                  children: [
                    Text(
                      "${authController.displayUserName}",
                      style: TextStyle(
                          color: Colors.white, fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "CF",
                          style: TextStyle(
                              color: Colors.amber, fontSize: 30),
                        ),
                        Text(
                          "EG",
                          style: TextStyle(
                              color: Colors.white, fontSize: 30),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
