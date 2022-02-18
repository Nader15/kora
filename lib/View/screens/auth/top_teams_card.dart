import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kora/Routes/routes.dart';
import 'package:kora/Utils/colors.dart';

class TopTeamsCard extends StatelessWidget {
  const TopTeamsCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      padding: EdgeInsets.all(5),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 1,
            mainAxisSpacing: 15,
            crossAxisSpacing: 12,
            // mainAxisExtent: 80
          ),
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Get.toNamed(Routes.teamScreen);
              },
              child: Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: greyPrimaryColor,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage("assets/images/team_cover.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  child: Text(
                    "فريق أبوعريضة",
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
