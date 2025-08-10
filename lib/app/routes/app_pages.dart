// lib/app/routes/app_pages.dart

import 'package:get/get.dart';
import 'package:conte/app/views/login_view.dart';
import 'package:conte/app/bindings/login_binding.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    // GetPage(
    //   name: Routes.HOME,
    //   page: () => HomeView(),
    //   binding: HomeBinding(),
    // ),
  ];
}