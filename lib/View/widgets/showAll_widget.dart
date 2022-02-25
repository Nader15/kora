import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kora/Logic/Controllers/main_controller.dart';
import 'package:kora/Logic/Controllers/tournaments_controller.dart';
import 'package:kora/Utils/colors.dart';

class ShowAllMatchesWidget extends StatelessWidget {
  ShowAllMatchesWidget({Key key}) : super(key: key);
  final controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "مباريات اليوم",
            style: TextStyle(
              color: whiteColor,
              fontSize: 25,
            ),
          ),
          InkWell(
            onTap: () {
              controller.currentIndex.value = 2;
            },
            child: Column(
              children: [
                Text(
                  "الكل",
                  style: TextStyle(
                    color: amberColor,
                    fontSize: 20,
                  ),
                ),
                Container(
                  width: 50,
                  color: amberColor,
                  height: 1,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
