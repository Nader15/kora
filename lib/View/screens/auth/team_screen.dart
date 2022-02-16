import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kora/Logic/Controllers/tournaments_controller.dart';
import 'package:kora/Utils/colors.dart';
import 'package:kora/View/widgets/top_players_card.dart';

class TeamScreen extends StatelessWidget {
  TeamScreen({Key key}) : super(key: key);
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
                  "فريق أبوعريضة",
                  style: TextStyle(color: whiteColor),
                ),
                background: Image.asset(
                  "assets/images/team.png",
                  // width: double.infinity,
                  fit: BoxFit.cover,
                  color: blackColor,
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
                  onPressed: () {},
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
        body: TopPlayersCard(),
      ),
    );
  }
}
