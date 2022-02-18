import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kora/Routes/routes.dart';
import 'package:kora/Utils/colors.dart';

class TeamLineupScreen extends StatelessWidget {
  const TeamLineupScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        onPressed: () {
          Get.bottomSheet(
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
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
            backgroundColor: blackColor,
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
        },
        child: Text("البدلاء"),
        backgroundColor: greyPrimaryColor,
      ),
      appBar: AppBar(
        title: Text(
          "تشكيلة فريق أبوعريضة",
          style: TextStyle(color: whiteColor),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [IconButton(icon: Icon(Icons.share), onPressed: () {})],
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
              lineupPlayer("CF"),
              Spacer(
                flex: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  lineupPlayer("LM"),
                  lineupPlayer("CM"),
                  lineupPlayer("RM"),
                ],
              ),
              Spacer(
                flex: 4,
              ),
              lineupPlayer("CB"),
              Spacer(
                flex: 1,
              ),
              lineupPlayer("GK"),
              Spacer(
                flex: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget lineupPlayer(String position) {
    return InkWell(
      onTap: (){
        Get.toNamed(Routes.profileScreen);
      },
      child: Container(
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
                        position,
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
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whiteColor,
                ),
                child: Text(
                  "Nader Salah",
                  style: TextStyle(
                    color: blackColor,
                    fontSize: 12,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
