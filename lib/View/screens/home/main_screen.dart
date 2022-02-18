import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kora/Logic/Controllers/auth_controller.dart';
import 'package:kora/Logic/Controllers/main_controller.dart';
import 'package:kora/Logic/Controllers/tournaments_controller.dart';
import 'package:kora/Routes/routes.dart';
import 'package:kora/Utils/colors.dart';
import 'package:kora/View/screens/auth/profile_screen.dart';
import 'package:kora/View/widgets/circular_cached_images_widget.dart';
import 'package:kora/View/widgets/user_another_card.dart';
import 'package:kora/View/widgets/user_card.dart';

class MainScreen extends StatelessWidget {
  final controller = Get.find<MainController>();
  final authController = Get.find<AuthController>();

  // final tournamentsController = Get.find<TournamentsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: greyPrimaryColor,
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
              iconSize: 30,
              color: whiteColor,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.profileScreen);
                },
                child: CircularCachedImagesWidget(
                  image: "${authController.displayUserPhoto}",
                ),
              ),
            ),
          ],
          elevation: 0,
          // backgroundColor: Colors.white,
        ),
        drawer: Drawer(
          elevation: 0,
          child: SafeArea(
            child: Container(
              color: Colors.black,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.profileScreen);
                      },
                      child: UserCard(),
                      // child: UserAnotherCard(),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Home",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(Routes.profileScreen);
                    },
                    leading: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Profile",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Settings",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  GetBuilder<AuthController>(
                    builder: (_) => ListTile(
                      onTap: () {
                        Get.defaultDialog(
                            title: 'تسجيل خروج',
                            content: Text('تأكيد تسجيل الخروج من التطبيق ؟'),
                            textConfirm: 'نعم',
                            textCancel: 'لا',
                            onCancel: () {
                              Get.back();
                            },
                            onConfirm: () {
                              authController.signOut();
                            });
                      },
                      leading: Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      title: Text(
                        "Log Out",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        backgroundColor: blackColor,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          backgroundColor: greyPrimaryColor,
          selectedItemColor: primaryColor,
          unselectedItemColor: greyColor,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_baseball_rounded), label: 'الدورات'),
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_baseball_rounded), label: 'الماتشات'),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.person), label: 'الشخصية'),
          ],
          onTap: (index) {
            controller.currentIndex.value = index;
          },
        ),
        body: SafeArea(
          child: IndexedStack(
            index: controller.currentIndex.value,
            children: controller.tabs,
          ),
        ),
      );
    });
  }
}
