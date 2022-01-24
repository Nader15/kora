import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kora/Utils/colors.dart';
import 'package:kora/View/screens/auth/today_matches.dart';
import 'package:kora/View/screens/auth/top_players.dart';

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
              Padding(
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
                      onTap: (){},
                      child: Column(
                        children: [
                          Text(
                            "الكل",
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 20,
                            ),
                          ),
                          Container(width: 50,color: primaryColor,height: 1,)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              TodayMatches(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "أبرز اللاعبين",
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 25,
                      ),
                    ),
                    InkWell(
                      onTap: (){},
                      child: Column(
                        children: [
                          Text(
                            "الكل",
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 20,
                            ),
                          ),
                          Container(width: 50,color: primaryColor,height: 1,)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              TopPlayersCard(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "أبرز الفرق",
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 25,
                      ),
                    ),
                    InkWell(
                      onTap: (){},
                      child: Column(
                        children: [
                          Text(
                            "الكل",
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 20,
                            ),
                          ),
                          Container(width: 50,color: primaryColor,height: 1,)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
