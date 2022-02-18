import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kora/Logic/Controllers/tournaments_controller.dart';
import 'package:kora/Utils/colors.dart';

class TournamentsCard extends StatelessWidget {
  TournamentsCard({Key key}) : super(key: key);
  final controller = Get.find<TournamentsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: const CircularProgressIndicator());
      } else
        return GridView.builder(
          itemCount: controller.tournamentsList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 20,
              mainAxisSpacing: 1,
              crossAxisSpacing: 2,
              mainAxisExtent: 200),
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return tournamentsItem(
              controller.tournamentsList[index].image,
            );
          },
        );
    });
  }

  Widget tournamentsItem(String image) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CachedNetworkImage(
        imageUrl: image,
        imageBuilder: (context, imageProvider) => InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                )),
          ),
        ),
        placeholder: (context, url) => Container(
          decoration: BoxDecoration(
            color: greyPrimaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: CircularProgressIndicator(),),
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
