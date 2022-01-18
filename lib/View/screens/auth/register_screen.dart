import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kora/Logic/Controllers/auth_controller.dart';
import 'package:kora/Routes/routes.dart';
import 'package:kora/Utils/navigation.dart';
import 'package:kora/Utils/validation.dart';
import 'package:kora/View/screens/auth/login_screen.dart';
import 'package:kora/View/widgets/default_FormField.dart';
import 'package:kora/View/widgets/default_button.dart';

class RegisterScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var ageController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'REGISTER',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 30.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Register now to start your exiting journey',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  DefaultFormField(
                    isObscure: false,
                    validator: validateName,
                    controller: nameController,
                    type: TextInputType.name,
                    label: 'Full Name',
                    prefix: Icons.person,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  DefaultFormField(
                    isObscure: false,
                    validator: validatePhone,
                    controller: phoneController,
                    type: TextInputType.phone,
                    label: 'Phone',
                    prefix: Icons.phone,
                    // Value: phoneNumber,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  DefaultFormField(
                    isObscure: false,
                    validator: validateAge,
                    controller: ageController,
                    type: TextInputType.number,
                    label: 'Age',
                    prefix: Icons.phone,
                    // Value: phoneNumber,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  DefaultFormField(
                    isObscure: false,
                    validator: validateEmail,
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    label: 'Email',
                    prefix: Icons.email,
                    // Value: phoneNumber,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  DefaultFormField(
                    isObscure: false,
                    validator: validatePassword,
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    label: 'Password',
                    prefix: Icons.no_encryption_sharp,
                    // Value: phoneNumber,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  GetBuilder<AuthController>(builder: (_) {
                    return DefaultButton(
                      function: () {
                        if (formKey.currentState.validate()) {
                          controller.signUpEmailAndPassword(
                              nameController.text,
                              ageController.text,
                              phoneController.text,
                              emailController.text,
                              passwordController.text);
                        }
                      },
                      text: 'Register',
                    );
                  }),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Have an account?',
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.login);
                        },
                        child: Text(
                          'LOGIN',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildNextButton() {
  //   return Align(
  //     alignment: Alignment.centerRight,
  //     child: ElevatedButton(
  //       onPressed: () {
  //         // showProgressIndicator(context);
  //         if (formKey.currentState.validate()) {
  //           controller.signUpEmailAndPassword(
  //               '', '', 'barry.allen@examples.com', '0');
  //         }
  //         // controller.signUpEmailAndPassword(
  //         //     '', '', 'barry.allen@examples.com', '0');
  //       },
  //       child: Text(
  //         'Next',
  //         style: TextStyle(color: Colors.white, fontSize: 16),
  //       ),
  //       style: ElevatedButton.styleFrom(
  //         minimumSize: Size(110, 50),
  //         primary: Colors.black,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(6),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  void showProgressIndicator(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ),
    );

    showDialog(
      barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alertDialog;
      },
    );
  }
}
