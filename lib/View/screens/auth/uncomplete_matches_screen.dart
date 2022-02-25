import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kora/Logic/Controllers/tournaments_controller.dart';
import 'package:kora/Routes/routes.dart';
import 'package:kora/Utils/colors.dart';
import 'package:kora/Utils/statics.dart';
import 'package:kora/View/widgets/matches_card.dart';
import 'package:kora/View/widgets/uncompleate_matches_card.dart';

class UnCompleteMatchesScreen extends StatelessWidget {
  UnCompleteMatchesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StaticUI().customAppBar(
        title: "أنضم الي مباراة",
        onPress: () {},
      ),
      floatingActionButton: FlatButton(
        padding: EdgeInsets.all(10),
        color: amberColor,
        onPressed: () {
          Get.toNamed(Routes.createMatchStep1Screen);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          "إنشاء مباراة",
          style: TextStyle(color: blackColor),
        ),
      ),
      body: UnCompleteMatchesCard(),
    );
  }
}
