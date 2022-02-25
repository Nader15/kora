

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kora/Logic/Controllers/main_controller.dart';
import 'package:kora/Routes/routes.dart';
import 'package:kora/Utils/colors.dart';

String apiUrl = 'https://fakestoreapi.com';
final controller = Get.find<MainController>();
class StaticUI{
  Future<bool> onWillPop() async {
    Get.defaultDialog(
        title: 'الخروج',
        content: Text('هل ترديد الخروج من التطبيق الآن ؟'),
        textConfirm: 'نعم',
        textCancel: 'لا',
        onCancel: () {
          // Get.back();
        },
        onConfirm: () {
          SystemChannels.platform
              .invokeMethod('SystemNavigator.pop');
        });
  }
  Future<bool> onMatchCreationPop() async {
    Get.defaultDialog(
        title: 'إلغاء',
        content: Text('هل تريد إلغاء انشاء المباراة أم الإستمرار ؟'),
        textConfirm: 'إلغاء',
        textCancel: 'إستمرار',
        onCancel: () {
          // Get.back();

        },
        onConfirm: () {
          Get.back();
          controller.currentIndex.value=2;
          Get.toNamed(Routes.mainScreen);
        });
  }
  AppBar customAppBar({@required String title ,@required Function onPress}){
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: whiteColor),
      ),
      centerTitle: true,
      backgroundColor: greyPrimaryColor,
      actions: [IconButton(icon: Icon(Icons.share), onPressed: onPress)],
    );
  }
}