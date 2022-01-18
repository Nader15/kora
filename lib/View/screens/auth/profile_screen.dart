import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kora/Logic/Controllers/auth_controller.dart';
import 'package:kora/View/widgets/default_button.dart';

class ProfileScreen extends StatelessWidget {
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Profile Screen"),
          // GetBuilder<AuthController>(
          //   builder: (_) {
          //     return DefaultButton(
          //       function: () {
          //         Get.defaultDialog(
          //             title: 'تسجيل خروج',
          //             content: Text('تأكيد تسجيل الخروج من التطبيق ؟'),
          //             textConfirm: 'نعم',
          //             textCancel: 'لا',
          //             onCancel: (){
          //               Get.back();
          //             },
          //             onConfirm: () {
          //               controller.signOut();
          //             });
          //       },
          //       text: 'logout',
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
