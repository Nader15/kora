import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kora/Logic/Controllers/auth_controller.dart';
import 'package:kora/Logic/Controllers/main_controller.dart';

class MainScreen extends StatelessWidget {
  final controller = Get.find<MainController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (context) => Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/profile_image.jpg'),
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
              iconSize: 30,
              color: Colors.black,
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
                      height: MediaQuery.of(context).size.height / 4,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            color: Colors.blue.withOpacity(0.1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "ST",
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 40),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "EG",
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 30),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  width: 140,
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
                            color: Colors.blue.withOpacity(0.1),
                            child: Text(
                              "Nader Salah",
                              style: TextStyle(color: Colors.red),
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
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_baseball_rounded), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
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
