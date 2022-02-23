import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kora/Logic/Controllers/auth_controller.dart';
import 'package:kora/Logic/Controllers/main_controller.dart';
import 'package:kora/Logic/Controllers/tournaments_controller.dart';
import 'package:kora/Routes/routes.dart';
import 'package:kora/Utils/colors.dart';
import 'package:kora/View/screens/auth/profile_screen.dart';
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
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {},
                  iconSize: 35,
                  color: whiteColor,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle
                  ),
                  child: Text("1"),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.profileScreen);
                },
                child: CachedNetworkImage(
                  imageUrl: "${authController.displayUserPhoto}",
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
            ),
          ],
          elevation: 0,
          // backgroundColor: Colors.white,
        ),
        drawer: Drawer(
          elevation: 0,
          child: SafeArea(
            child: Container(
              color: blackColor,
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
                      color: whiteColor,
                    ),
                    title: Text(
                      "Home",
                      style: TextStyle(color: whiteColor),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(Routes.profileScreen);
                    },
                    leading: Icon(
                      Icons.person,
                      color: whiteColor,
                    ),
                    title: Text(
                      "Profile",
                      style: TextStyle(color: whiteColor),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.settings,
                      color: whiteColor,
                    ),
                    title: Text(
                      "Settings",
                      style: TextStyle(color: whiteColor),
                    ),
                  ),
                  Divider(
                    color: greyColor,
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
          selectedItemColor: amberColor,
          // selectedItemColor: primaryColor,
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
