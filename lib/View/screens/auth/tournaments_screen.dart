import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kora/Logic/Controllers/tournaments_controller.dart';
import 'package:kora/Utils/colors.dart';
import 'package:kora/View/screens/auth/tournments_card.dart';

class TournamentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: greyPrimaryColor,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(10),
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
              child: TextFormField(
                keyboardType: TextInputType.text,
                style: TextStyle(color: whiteColor, height: .8),
                cursorColor: whiteColor,
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                    fillColor: Colors.grey.withOpacity(.1),
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'أبحث عن الدورات',
                    prefixIcon: Icon(
                      Icons.search,
                      color: whiteColor,
                    ),
                    hintStyle: TextStyle(
                        color: whiteColor.withOpacity(.8), fontSize: 13)),
              ),
            ),
          ),
        ),
        body: TournamentsCard());
  }
}
