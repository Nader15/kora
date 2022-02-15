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
            mainAxisExtent: 200
          ),
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
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          )),
        ),
      ),
    );
  }
}
