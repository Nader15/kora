import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kora/Logic/Controllers/auth_controller.dart';
import 'package:kora/Logic/Controllers/main_controller.dart';
import 'package:kora/Logic/Controllers/tournaments_controller.dart';
import 'package:kora/Utils/colors.dart';

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
          // leading: Builder(
          //   builder: (context) => InkWell(
          //     onTap: () => Scaffold.of(context).openDrawer(),
          //     child: Icon(Icons.menu_rounded,color: Colors.black,)
          //   ),
          // ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
              iconSize: 30,
              color: whiteColor,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile_image.jpg'),
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
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3.6,
                      decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.1),
                          border: Border.all(color: primaryColor, width: 2),
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
                                        style: TextStyle(
                                            color: primaryColor, fontSize: 20),
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
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  width:  MediaQuery.of(context).size.width / 3.1,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10)),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "assets/images/profile_image.jpg",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "نادر صلاح",
                              style: TextStyle(color: primaryColor,fontSize: 20),
                            ),
                          ),
                        ],
                      ),
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
                    onTap: () {},
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
                        "LogOut",
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
