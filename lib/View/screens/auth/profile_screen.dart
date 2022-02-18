import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kora/Logic/Controllers/auth_controller.dart';
import 'package:kora/Routes/routes.dart';
import 'package:kora/Utils/colors.dart';
import 'package:kora/View/screens/auth/team_screen.dart';
import 'package:kora/View/widgets/user_another_card.dart';
import 'package:kora/View/widgets/user_card.dart';
import 'package:kora/View/widgets/rating_widget.dart';
import 'package:lottie/lottie.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [IconButton(icon: Icon(Icons.share), onPressed: () {})],
        ),
        body: SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 50),
                      child: UserCard(),
                    ),
                  ),
                  Center(
                    child: FlatButton(
                      splashColor: amberColor,
                      onPressed: () {
                        Get.toNamed(Routes.teamScreen);
                      },
                      child: Text("فريق أبوعريضة",style: TextStyle(color: whiteColor),),
                    ),
                  ),
                  // UserAnotherCard(),
                  RatingWidget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                            color: greyPrimaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "البيانات",
                                  style: TextStyle(
                                    color: whiteColor,
                                    fontSize: 20,
                                  ),
                                ),
                                CircleAvatar(
                                  child: IconButton(
                                    onPressed: () {},
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    icon: Icon(Icons.edit_outlined),
                                    color: whiteColor,
                                  ),
                                  backgroundColor:
                                      primaryColor.withOpacity(0.1),
                                )
                              ],
                            ),
                            Divider(
                              color: greyColor.withOpacity(0.5),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                statisticsContainer(context, "العمر", "22"),
                                statisticsContainer(context, "المباريات", "12"),
                                statisticsContainer(context, "الأهداف", "7"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                          color: greyPrimaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "البطولات",
                                style: TextStyle(
                                  color: whiteColor,
                                  fontSize: 20,
                                ),
                              ),
                              CircleAvatar(
                                child: IconButton(
                                  onPressed: () {},
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  icon: Icon(Icons.add),
                                  color: whiteColor,
                                ),
                                backgroundColor: primaryColor.withOpacity(0.1),
                              )
                            ],
                          ),
                          Divider(
                            color: greyColor.withOpacity(0.5),
                          ),
                          SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: GridView.builder(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                childAspectRatio: 1.4,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 1,
                                // mainAxisExtent: 80
                              ),
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return tournamentsContainer(
                                    context, "أبوعريضة", "2");
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget statisticsContainer(
          BuildContext context, String title, String count) =>
      Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: primaryColor.withOpacity(0.1),
          // borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(title, style: TextStyle(color: whiteColor, fontSize: 20)),
            Text(count, style: TextStyle(color: amberColor, fontSize: 25)),
          ],
        ),
      );

  Widget tournamentsContainer(
          BuildContext context, String title, String result) =>
      Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(color: whiteColor, fontSize: 20)),
            // Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 3,
                    child: Lottie.asset(
                      "assets/images/animated_trophy.json",
                      width: 200,
                    ),
                  ),
                  Expanded(
                    child: CircleAvatar(
                      backgroundColor: amberColor,
                      radius: 15,
                      child: Text(
                        "2",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
