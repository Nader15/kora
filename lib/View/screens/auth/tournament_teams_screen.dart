import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kora/Logic/Controllers/tournaments_controller.dart';
import 'package:kora/Routes/routes.dart';
import 'package:kora/Utils/colors.dart';
import 'package:kora/View/widgets/top_players_card.dart';

class TournamentTeamScreen extends StatelessWidget {
  TournamentTeamScreen({Key key}) : super(key: key);
  final controller = Get.find<TournamentsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: greyPrimaryColor,
              pinned: true,
              expandedHeight: 220,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: EdgeInsetsGeometry.lerp(
                    EdgeInsets.all(10), EdgeInsets.all(10), 1),
                title: Text(
                  "دورة أبوعريضة",
                  style: TextStyle(color: whiteColor),
                ),
                background: Image.asset(
                  "assets/images/team_cover.jpg",
                  // width: double.infinity,
                  fit: BoxFit.fill,
                  // color: blackColor,
                  // height: 180,
                ),
              ),
              // flexibleSpace: FlexibleSpaceBar(
              //   title: Text("فريق أبوعريضة"),
              //   centerTitle: true,
              // ),
              actions: [
                IconButton(
                  icon: Image.asset(
                    'assets/images/football_lineup.png',
                    color: whiteColor,
                    width: 25,
                  ),
                  tooltip: 'التشكيلة',
                  onPressed: () {
                    Get.toNamed(Routes.teamLineupScreen);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  tooltip: 'مشاركة الفريق',
                  onPressed: () {},
                ),
              ],
            ),
          ];
        },
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "3",
                    style: TextStyle(color: amberColor, fontSize: 20),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "الفرق المشاركة",
                    style: TextStyle(color: amberColor,fontSize: 15),
                  ),
                ],
              ),
            ),
            GridView.builder(
              padding: EdgeInsets.zero,
              // itemCount: controller.tournamentsList.length,
              itemCount: 3,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 5,
                mainAxisSpacing: 0,
                crossAxisSpacing: 12,
                // mainAxisExtent: 80
              ),
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: greyPrimaryColor,
                      onTap: () {
                        Get.toNamed(Routes.teamScreen);
                      },
                      leading: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CachedNetworkImage(
                          imageUrl: controller.tournamentsList[index].image,
                          imageBuilder: (context, imageProvider) =>
                              CircleAvatar(
                            backgroundImage: imageProvider,
                          ),
                          placeholder: (context, url) => Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),

                      title: Text(
                        "فريق أبوعريضة",
                        style: TextStyle(color: whiteColor),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
