// lib/app/controllers/home_controller.dart

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:conte/app/views/pages/order_view.dart';
import 'package:conte/app/views/pages/notification_view.dart';
import 'package:conte/app/views/pages/info_view.dart';

class HomeController extends GetxController {
  // 현재 선택된 탭의 인덱스를 관리하는 RxInt 변수
  final RxInt selectedIndex = 0.obs;

  // 각 탭에 해당하는 페이지 위젯 리스트
  final List<Widget> pages = [
    const OrderView(),
    const NotificationView(),
    const InfoView(),
  ];

  // 탭 변경 시 호출될 함수
  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}