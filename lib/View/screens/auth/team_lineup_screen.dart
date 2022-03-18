import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kora/Routes/routes.dart';
import 'package:kora/Utils/colors.dart';
import 'package:kora/Utils/statics.dart';

class TeamLineupScreen extends StatelessWidget {
  const TeamLineupScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        onPressed: () {
          bottomSheet(context);
        },
        child: Text("البدلاء"),
        backgroundColor: greyPrimaryColor,
      ),
      appBar: StaticUI().customAppBar(
        title: "تشكيلة فريق أبوعريضة",
        onPress: () {},
      ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SvgPicture.asset(
            "assets/images/football_pitch.svg",
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              Spacer(
                flex: 5,
              ),
              lineupPlayer("CF",context),
              Spacer(
                flex: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  lineupPlayer("LM",context),
                  lineupPlayer("CM",context),
                  lineupPlayer("RM",context),
                ],
              ),
              Spacer(
                flex: 4,
              ),
              lineupPlayer("CB",context),
              Spacer(
                flex: 1,
              ),
              lineupPlayer("GK",context),
              Spacer(
                flex: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget lineupPlayer(String position,BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.profileScreen);
      },
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width / 3.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(
                    width: 50,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      // shape: BoxShape.rectangle,
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image:
                          AssetImage("assets/images/player_avatar.png")),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: amberColor,
                    radius: 10,
                    child: Text(
                      position,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "Nader Salah",
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> bottomSheet(BuildContext context) {
    return Get.bottomSheet(
      Container(
        height: 300,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Text(
                "البدلاء",
                style: TextStyle(color: whiteColor, fontSize: 20),
              ),
              Container(
                height: 2,
                width: MediaQuery.of(context).size.width / 4,
                color: greyColor,
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: 5,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 2.8,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 1,
                      // mainAxisExtent: 80
                    ),
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: CircleAvatar(
                                      backgroundColor: amberColor,
                                      radius: 10,
                                      child: Text(
                                        "CB",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: SvgPicture.asset(
                                      "assets/images/player_shirt.svg",
                                      semanticsLabel: 'Acme Logo',
                                      fit: BoxFit.fill,
                                      width: 60,
                                      color: whiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Nader Salah",
                                style: TextStyle(
                                  color: whiteColor,
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: greyPrimaryColor,
      // backgroundColor: blackColor.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      elevation: 10,
      // clipBehavior: Clip.hardEdge
    );
  }
}
