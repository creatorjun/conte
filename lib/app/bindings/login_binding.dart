// lib/app/bindings/login_binding.dart

import 'package:get/get.dart';
import 'package:conte/app/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
          () => LoginController(),
    );
  }
}