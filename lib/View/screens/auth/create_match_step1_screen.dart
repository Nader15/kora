import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kora/Logic/Controllers/tournaments_controller.dart';
import 'package:kora/Routes/routes.dart';
import 'package:kora/Utils/colors.dart';
import 'package:kora/Utils/statics.dart';
import 'package:kora/View/widgets/default_FormField.dart';
import 'package:kora/View/widgets/matches_card.dart';
import 'package:kora/View/widgets/uncompleate_matches_card.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CreateMatchStep1Screen extends StatelessWidget {
  CreateMatchStep1Screen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => StaticUI().onMatchCreationPop(),
      child: Scaffold(
        bottomNavigationBar: Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon(Icons.arrow_back, color: whiteColor),
                    Text(
                      "إنشاء",
                      style: TextStyle(color: whiteColor, fontSize: 18),
                    )
                  ],
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(greyPrimaryColor),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.all(20),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  Get.toNamed(Routes.createMatchStep2Screen);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "أدعوا الفرق",
                      style: TextStyle(color: blackColor, fontSize: 18),
                    ),
                    Icon(Icons.arrow_forward, color: blackColor)
                  ],
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(amberColor),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.all(20),
                  ),
                ),
              ),
            ),
          ],
        ),
        appBar: StaticUI().customAppBar(
          title: "أنشاء مباراة",
          onPress: () {},
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                StepProgressIndicator(
                  totalSteps: 2,
                  currentStep: 1,
                  selectedColor: amberColor,
                  unselectedColor: greyColor,
                  padding: 5,
                  size: 8,
                  roundedEdges: Radius.circular(10),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "التفاصيل",
                        style: TextStyle(color: amberColor),
                      ),
                      Text(
                        "أدعوا الفرق",
                        style: TextStyle(color: whiteColor),
                      ),
                    ],
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ملعب المباراة",
                        style: TextStyle(color: whiteColor, fontSize: 15),
                      ),
                      TextFormField(
                        style: TextStyle(color: whiteColor),
                        showCursor: false,
                        decoration: InputDecoration(
                          hintText: "أدخل الملعب",
                          hintStyle: TextStyle(color: greyColor, fontSize: 15),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: greyPrimaryColor)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: greyPrimaryColor)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "العنوان",
                        style: TextStyle(color: whiteColor, fontSize: 15),
                      ),
                      TextFormField(
                        style: TextStyle(color: whiteColor),
                        showCursor: false,
                        decoration: InputDecoration(
                          hintText: "أدخل العنوان بالتفصيل",
                          hintStyle: TextStyle(color: greyColor, fontSize: 15),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: greyPrimaryColor)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: greyPrimaryColor)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Text(
                          "التاريخ",
                          style: TextStyle(color: whiteColor),
                        ),
                        trailing: Container(
                          // color: Colors.red,
                          width: MediaQuery.of(context).size.width / 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "30/3/2022",
                                style: TextStyle(color: whiteColor),
                              ),
                              InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.date_range,
                                    color: whiteColor,
                                  ),),
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Text(
                          "الوقت",
                          style: TextStyle(color: whiteColor),
                        ),
                        trailing: Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "05:00 مساء",
                                style: TextStyle(color: whiteColor),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.access_time,
                                  color: whiteColor,
                                ),),
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Text(
                          "عدد الساعات",
                          style: TextStyle(color: whiteColor),
                        ),
                        trailing: Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "1.5 ساعة",
                                style: TextStyle(color: whiteColor),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: whiteColor,
                                ),),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "سعر الساعة",
                        style: TextStyle(color: whiteColor, fontSize: 15),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        style: TextStyle(color: whiteColor),
                        showCursor: false,
                        decoration: InputDecoration(
                          hintText: "أدخل سعر الساعة",
                          hintStyle: TextStyle(color: greyColor, fontSize: 15),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: greyPrimaryColor)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: greyPrimaryColor)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
