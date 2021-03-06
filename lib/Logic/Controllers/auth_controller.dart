import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kora/Routes/routes.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  var googleSignIn = GoogleSignIn();
  var displayUserName = ''.obs;
  var displayUserPhoto = ''.obs;
  var displayUserEmail = ''.obs;
  RxDouble newRating = 0.0.obs;
  bool isLogIn = false;
  GetStorage authBox = GetStorage();

  User get userProfile => auth.currentUser;

  @override
  void onInit() {
    displayUserName.value = userProfile != null ? userProfile.displayName : "";
    displayUserPhoto.value = userProfile != null ? userProfile.photoURL : "";
    displayUserEmail.value = userProfile != null ? userProfile.email : "";
    super.onInit();
  }

  void signUpEmailAndPassword(
    String fullName,
    String age,
    String phone,
    String email,
    String password,
  ) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = '';
      String message = '';
      if (error.code == 'weak-password') {
        title = 'هذا الباسورد ضعيف';
        message = 'ادخل باسورد لايقل عن 6 ارقام للأمان';
      } else if (error.code == 'email-already-in-use') {
        title = 'هذا الإيميل مسجل بالفعل';
        message = 'برجاء ادخال ايميل اخر';
      }
      Get.snackbar(title.toString(), message.toString(),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 10.0);
    } catch (error) {
      Get.snackbar(
        'ERROR!',
        error.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      print(
        error.toString(),
      );
    }
  }

  void loginEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      isLogIn = true;
      authBox.write('isLogIn', isLogIn);
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = '';
      String message = '';
      if (error.code == 'user-not-found') {
        title = 'هذا الإيميل غير مسجل';
        message = 'برجاء ادخال ايميل مسجل لتتمكن من الدخول';
      } else if (error.code == 'wrong-password') {
        title = 'الباسورد غير صحيح';
        message = 'برجاء ادخال الباسورد الصحيح لهذا الايميل';
      }
      Get.snackbar(
        title.toString(),
        message.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10.0,
      );
    }
  }

  void googleSignUp() async {
    try {
      final GoogleSignInAccount googleUser = await googleSignIn.signIn();
      displayUserName.value = googleUser.displayName;
      displayUserPhoto.value = googleUser.photoUrl;
      displayUserEmail.value = googleUser.email;
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      await auth.signInWithCredential(authCredential);
      isLogIn = true;
      authBox.write('isLogIn', isLogIn);
      update();
      Get.offNamed(Routes.mainScreen);
    } catch (error) {
      Get.snackbar(
        'ERROR!',
        error.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      print(error.toString());
    }
  }

  void signOut() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      isLogIn = false;
      authBox.remove('isLogIn');
      update();
      Get.offNamed(Routes.splash);
    } catch (error) {
      Get.snackbar(
        'ERROR!',
        error.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      print(error.toString());
    }
  }
}
