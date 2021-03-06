import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kora/Logic/Controllers/auth_controller.dart';
import 'package:kora/Utils/colors.dart';

class UserCard extends StatelessWidget {
  UserCard({Key key}) : super(key: key);
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height / 3.5,
      decoration: BoxDecoration(
          color: greyPrimaryColor,
          border: Border.all(color: primaryColor.withOpacity(0.2), width: 2),
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "مهاجم",
                        style: TextStyle(color: whiteColor, fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 40,
                        child: Image.network(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/2560px-Flag_of_Egypt.svg.png",
                        ),
                      )
                    ],
                  ),
                ),
                CachedNetworkImage(
                  imageUrl: "${authController.displayUserPhoto}",
                  imageBuilder: (context, imageProvider) => Container(
                    height:
                    MediaQuery.of(context).size.height / 5,
                    width:
                    MediaQuery.of(context).size.width / 3.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10)),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              "${authController.displayUserName}",
              style: TextStyle(color: whiteColor, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
