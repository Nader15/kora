import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kora/Logic/Controllers/tournaments_controller.dart';
import 'package:kora/Utils/colors.dart';
import 'package:kora/Utils/statics.dart';
import 'package:kora/View/widgets/default_FormField.dart';
import 'package:kora/View/widgets/matches_card.dart';
import 'package:kora/View/widgets/uncompleate_matches_card.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CreateMatchStep2Screen extends StatelessWidget {
  CreateMatchStep2Screen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.arrow_back, color: whiteColor),
                  Text(
                    "رجوع",
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
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "إنشاء",
                    style: TextStyle(color: blackColor, fontSize: 18),
                  ),
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  StepProgressIndicator(
                    totalSteps: 2,
                    currentStep: 2,
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
                          style: TextStyle(color: amberColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TextFormField(
              textAlignVertical: TextAlignVertical.center,
              keyboardType: TextInputType.text,
              showCursor: false,
              style: TextStyle(color: whiteColor, height: .8),
              cursorColor: whiteColor,
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                fillColor: Colors.grey.withOpacity(.1),
                filled: true,
                border: InputBorder.none,
                // border: OutlineInputBorder(
                //     borderSide: BorderSide.none,
                //     borderRadius: BorderRadius.circular(10)),
                hintText: 'أبحث عن الفرق : مثال ( ابوعريضة )',
                prefixIcon: Icon(
                  Icons.search,
                  color: whiteColor,
                ),
                hintStyle: TextStyle(
                  color: whiteColor.withOpacity(.8),
                  fontSize: 13,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                decoration: BoxDecoration(
                    color: greyPrimaryColor,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    Text(
                      ":  أدعوا اللاعبين من خلال",
                      style: TextStyle(color: greyColor),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FlatButton(
                          onPressed: (){},
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/images/facebook.png"),
                              ),
                              Text(
                                "FaceBook",
                                style: TextStyle(color: whiteColor),
                              )
                            ],
                          ),
                        ),
                        FlatButton(
                          onPressed: (){},
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/images/whatsapp.png"),
                              ),
                              Text(
                                "WhatsApp",
                                style: TextStyle(color: whiteColor),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
