import 'package:conte/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:conte/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.pageTitles[controller.selectedIndex.value])),
      ),
      drawer: _buildDrawer(),
      body: Obx(() => controller.pages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
            () => StylishBottomBar(
          option: BubbleBarOptions(
            barStyle: BubbleBarStyle.horizontal,
            bubbleFillStyle: BubbleFillStyle.fill,
            opacity: 0.3,
          ),
          items: [
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

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              controller.user.nickname ?? '손님',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            accountEmail: null,
            currentAccountPicture: CircleAvatar(
              backgroundImage: controller.user.profileImageUrl != null
                  ? NetworkImage(controller.user.profileImageUrl!)
                  : null,
              child: controller.user.profileImageUrl == null
                  ? const Icon(Icons.person, size: 50)
                  : null,
            ),
            decoration: const BoxDecoration(
              color: Colors.brown,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.edit_outlined),
            title: const Text('정보 수정'),
            onTap: () {
              Get.back(); // Drawer를 닫습니다.
              Get.toNamed(Routes.profileEdit);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text('로그아웃'),
            onTap: () {
              controller.logout();
            },
          ),
        ],
      ),
    );
  }
}