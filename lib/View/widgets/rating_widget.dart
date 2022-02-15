import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:kora/Logic/Controllers/auth_controller.dart';

class RatingWidget extends StatelessWidget {
  RatingWidget({Key key}) : super(key: key);

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
          textDirection: TextDirection.ltr,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 30,
                  unratedColor: Colors.amber.withOpacity(0.2),
                  itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    authController.newRating.value = rating;
                    print(authController.newRating.value);
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Obx(
                  () {
                    return Text(
                      "${authController.newRating.value}",
                      style: TextStyle(color: Colors.amber, fontSize: 25),
                    );
                  },
                ),
              ],
            ),
          ),
        );
  }
}
