// lib/app/views/home/home_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// [수정] 메인 패키지 파일만 import 합니다.
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
// [수정] 올바른 컨트롤러 경로로 수정합니다.
import 'package:conte/app/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Obx를 사용하여 selectedIndex가 변경될 때마다 body가 자동으로 바뀜
      body: Obx(() => controller.pages[controller.selectedIndex.value]),

      // Obx를 StylishBottomBar에도 적용하여 UI가 항상 최신 상태를 반영하도록 합니다.
      bottomNavigationBar: Obx(
            () => StylishBottomBar(
          option: BubbleBarOptions(
            barStyle: BubbleBarStyle.horizontal,
            bubbleFillStyle: BubbleFillStyle.fill,
            opacity: 0.3,
          ),
          items: [
            // [수정] BottomBarItem 클래스는 stylish_bottom_bar.dart에 포함되어 있습니다.
            BottomBarItem(
              icon: const Icon(Icons.coffee_outlined),
              selectedIcon: const Icon(Icons.coffee),
              title: const Text('주문'),
              backgroundColor: Colors.brown,
            ),
            BottomBarItem(
              icon: const Icon(Icons.notifications_none_outlined),
              selectedIcon: const Icon(Icons.notifications),
              title: const Text('알림'),
              backgroundColor: Colors.orange,
              badge: const Text('9'),
              showBadge: true,
            ),
            BottomBarItem(
              icon: const Icon(Icons.person_outline),
              selectedIcon: const Icon(Icons.person),
              title: const Text('정보'),
              backgroundColor: Colors.blueAccent,
            ),
          ],
          hasNotch: true,
          currentIndex: controller.selectedIndex.value,
          onTap: (index) {
            controller.changeIndex(index);
          },
        ),
      ),
    );
  }
}