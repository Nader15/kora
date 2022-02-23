import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kora/Utils/colors.dart';
import 'package:kora/View/screens/auth/today_matches.dart';
import 'package:kora/View/widgets/top_teams_card.dart';
import 'package:kora/View/widgets/top_players_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              headerWidget(
                "مباريات اليوم",
                () {},
              ),
              TodayMatches(),
              headerWidget(
                "أبرز اللاعبين",
                () {},
              ),
              TopPlayersCard(),
              headerWidget(
                "أبرز الفرق",
                () {},
              ),
              TopTeamsCard(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget headerWidget(String title, Function onPress) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: whiteColor,
              fontSize: 25,
            ),
          ),
          InkWell(
            onTap: onPress,
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
