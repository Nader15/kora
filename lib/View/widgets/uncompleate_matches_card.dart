import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kora/Logic/Controllers/tournaments_controller.dart';
import 'package:kora/Routes/routes.dart';
import 'package:kora/Utils/colors.dart';

class UnCompleteMatchesCard extends StatelessWidget {
  UnCompleteMatchesCard({Key key}) : super(key: key);
  final controller = Get.find<TournamentsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: const CircularProgressIndicator());
      } else
        return GridView.builder(
          itemCount: 2,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            // childAspectRatio: 20,
            // mainAxisSpacing: 2,
            // crossAxisSpacing: 2,
            mainAxisExtent: 150,
          ),
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return matchesItem(context);
          },
        );
    });
  }



  Widget matchesItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shadowColor: amberColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: greyPrimaryColor,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      // color: Colors.red,
                      width: MediaQuery.of(context).size.width/3,
                      child: teams(
                        true,
                            () {
                          Get.toNamed(Routes.teamScreen);
                        },
                      ),
                    ),
                  ),
                  Container(
                  // color: Colors.red,
                  width: MediaQuery.of(context).size.width/5,
                    alignment: Alignment.center,
                    child: Text(
                      "14:00",
                      style: TextStyle(color: whiteColor,fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      // color: Colors.red,
                      width: MediaQuery.of(context).size.width/3,
                      child: teams(
                        false,
                            () {
                          Get.toNamed(Routes.teamScreen);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "15/5/2022",
                    style: TextStyle(color: whiteColor),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "الأربعاء",
                    style: TextStyle(color: whiteColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // child: CachedNetworkImage(
      //   imageUrl: image,
      //   imageBuilder: (context, imageProvider) => Card(
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(10),
      //     ),
      //     color: greyPrimaryColor,
      //     child: Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: [
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             // crossAxisAlignment: CrossAxisAlignment.end,
      //             children: [
      //               Row(
      //                 children: [
      //                   Text(
      //                     "أبوعريضة",
      //                     style: TextStyle(color: whiteColor),
      //                   ),
      //                   SizedBox(width: 10),
      //                   CircleAvatar(
      //
      //                     backgroundImage: imageProvider,
      //                   ),
      //                 ],
      //               ),
      //               Text(
      //                 "14:00",
      //                 style: TextStyle(color: whiteColor),
      //               ),
      //               Row(
      //                 children: [
      //                   CircleAvatar(
      //
      //                      backgroundImage: imageProvider,
      //                   ),
      //                   SizedBox(width: 10),
      //                   Text(
      //                     "أبوعريضة",
      //                     style: TextStyle(color: whiteColor),
      //                   ),
      //                 ],
      //               ),
      //             ],
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Text(
      //                 "15/5/2022",
      //                 style: TextStyle(color: whiteColor),
      //               ),
      //               SizedBox(width: 10),
      //               Text(
      //                 "الأربعاء",
      //                 style: TextStyle(color: whiteColor),
      //               ),
      //             ],
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      //   placeholder: (context, url) => Card(
      //     child: ListTile(
      //       tileColor: greyPrimaryColor,
      //       onTap: () {},
      //     ),
      //   ),
      //   errorWidget: (context, url, error) => Icon(Icons.error),
      // ),
    );
  }
  Widget teams(bool left, Function onPress) {
    return FlatButton(
      color: left?amberColor:Colors.transparent,
      onPressed: onPress,
      child: left
          ? Text(
        "أنضمام",
        style: TextStyle(color: blackColor),
      )
          : Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 60,
              child: Text(
                "أبوعريضة",
                style: TextStyle(color: whiteColor),
              ),
            ),
            SizedBox(width: 10),
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/team_cover.jpg"),
              // backgroundImage: imageProvider,
            ),
          ],
        ),
      ),
    );
  }
}
