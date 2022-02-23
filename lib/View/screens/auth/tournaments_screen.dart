import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kora/Logic/Controllers/tournaments_controller.dart';
import 'package:kora/Routes/routes.dart';
import 'package:kora/Utils/colors.dart';
import 'package:kora/View/widgets/tournments_card.dart';

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
      body: GridView.builder(
        itemCount: 1,
        // itemCount: controller.tournamentsList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 20,
            mainAxisSpacing: 1,
            crossAxisSpacing: 2,
            mainAxisExtent: 200),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return FlatButton(
            padding: const EdgeInsets.all(10),
            onPressed: () {
              // Get.toNamed(Routes.teamScreen);
            },
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: amberColor,
                        offset: Offset(0, 0.5),
                        blurRadius: 0,
                      ),
                    ],
                    color: greyPrimaryColor,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("assets/images/team_cover.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Container(
                    child: Text(
                      "دورة أبوعريضة",
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "12",
                        style: TextStyle(color: amberColor, fontSize: 20),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "الفرق المشاركة",
                        style: TextStyle(color: amberColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
      // body: TournamentsCard(),
    );
  }
}
