import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kora/Logic/Controllers/auth_controller.dart';
import 'package:kora/Routes/routes.dart';
import 'package:kora/Utils/navigation.dart';
import 'package:kora/Utils/validation.dart';
import 'package:kora/View/screens/auth/register_screen.dart';
import 'package:kora/View/widgets/default_FormField.dart';
import 'package:kora/View/widgets/default_button.dart';

class LoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();
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
                    'LOGIN',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 30.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Login now to start your exiting journey',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  DefaultFormField(
                    isObscure: false,
                    validator: validateEmail,
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    label: 'Email',
                    prefix: Icons.email,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  DefaultFormField(
                    validator: validatePassword,
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    label: 'Password',
                    prefix: Icons.lock_outline,
                    // suffix: ShopLoginCubit.get(context).suffixIcon,
                    // isObscure: ShopLoginCubit.get(context).isSecure,
                    isObscure: true,
                    suffixPressed: () {
                      // ShopLoginCubit.get(context).changeVisibility();
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  GetBuilder<AuthController>(
                    builder: (_) {
                      return DefaultButton(
                        function: () {
                          if (formKey.currentState.validate()) {
                            controller.loginEmailAndPassword(
                              emailController.text,
                              passwordController.text,
                            );
                          }
                        },
                        text: 'login',
                      );
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  GetBuilder<AuthController>(
                    builder: (_) {
                      return DefaultButton(
                        function: () {
                          controller.googleSignUp();
                        },
                        text: 'google',
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.register);
                        },
                        child: Text(
                          'REGISTER',
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
}
