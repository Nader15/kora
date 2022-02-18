import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kora/Logic/Controllers/tournaments_controller.dart';
import 'package:kora/Utils/colors.dart';

class TopPlayersCard extends StatelessWidget {
  TopPlayersCard({Key key}) : super(key: key);
  final controller = Get.find<TournamentsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: const CircularProgressIndicator());
      } else
        return GridView.builder(
          itemCount: controller.tournamentsList.length,
          // itemCount: 3,
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
            return topPlayersItem(
              context,
              controller.tournamentsList[index].image,
            );
          },
        );
    });
  }

  Widget topPlayersItem(BuildContext context, String image) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          tileColor: greyPrimaryColor,
          onTap: () {},
          leading: Padding(
            padding: const EdgeInsets.all(5.0),
            child: CachedNetworkImage(
              imageUrl: image,
              imageBuilder: (context, imageProvider) => CircleAvatar(
                backgroundImage: imageProvider,
              ),
              placeholder: (context, url) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          title: Row(
            children: [
              Text(
                "نادر صلاح",
                style: TextStyle(color: whiteColor),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "مهاجم",
                style: TextStyle(color: greyColor, fontSize: 12),
              ),
            ],
          ),
          subtitle: Text(
            "فريق أبوعريضة",
            style: TextStyle(color: greyColor, fontSize: 12),
          ),
          trailing: SizedBox(
            width: MediaQuery.of(context).size.width / 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "7",
                  style: TextStyle(color: whiteColor, fontSize: 20),
                ),
                Text(
                  "أهداف",
                  style: TextStyle(color: whiteColor, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
