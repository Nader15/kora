import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kora/Logic/Controllers/tournaments_controller.dart';
import 'package:kora/Utils/colors.dart';
import 'package:kora/View/widgets/matches_card.dart';

class MatchesScreen extends StatelessWidget {
  MatchesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FlatButton(
        padding: EdgeInsets.all(10),
        color: amberColor,
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          "إنشاء مباراة",
          style: TextStyle(color: blackColor),
        ),
      ),
      body: MatchesCard(),
    );
  }
}
