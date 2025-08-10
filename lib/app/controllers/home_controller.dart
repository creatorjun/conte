import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';

import 'package:conte/app/data/models/social_user.dart';
import 'package:conte/app/routes/app_pages.dart';
import 'package:conte/app/views/pages/info_view.dart';
import 'package:conte/app/views/pages/notification_view.dart';
import 'package:conte/app/views/pages/order_view.dart';

class HomeController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  late SocialUser user;

  final List<Widget> pages = [
    const OrderView(),
    const NotificationView(),
    const InfoView(),
  ];

  final List<String> pageTitles = [
    '주문',
    '알림',
    '정보',
  ];

  @override
  void onInit() {
    super.onInit();
    user = Get.arguments;
  }

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  Future<void> logout() async {
    try {
      await FlutterNaverLogin.logOut();
    } catch (e) {
      debugPrint("네이버 로그아웃 실패 또는 미로그인 상태: $e");
    }
    try {
      await UserApi.instance.logout();
    } catch (e) {
      debugPrint("카카오 로그아웃 실패 또는 미로그인 상태: $e");
    }
    Get.offAllNamed(Routes.login);
  }
}