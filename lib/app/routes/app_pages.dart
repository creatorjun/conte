// lib/app/routes/app_pages.dart

import 'package:conte/app/views/pages/profile_edit_view.dart';
import 'package:get/get.dart';
import 'package:conte/app/views/login_view.dart';
import 'package:conte/app/bindings/login_binding.dart';
import 'package:conte/app/views/home/home_view.dart'; // [추가]
import 'package:conte/app/bindings/home_binding.dart'; // [추가]

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    // [추가] 홈 화면 라우트 설정
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.profileEdit,
      page: () => const ProfileEditView(),
      // 간단한 페이지이므로 binding은 생략
    ),
  ];
}