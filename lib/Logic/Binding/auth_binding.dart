import 'package:get/get.dart';
import 'package:kora/Logic/Controllers/auth_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}