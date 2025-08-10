// lib/app/controllers/login_controller.dart

import 'package:get/get.dart';

class LoginController extends GetxController {
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void loginWithNaver() {
    // TODO: 네이버 로그인 로직 구현
    print('네이버 로그인 시도');
  }

  void loginWithKakao() {
    // TODO: 카카오 로그인 로직 구현
    print('카카오 로그인 시도');
  }
}