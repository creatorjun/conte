// lib/app/views/login_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:conte/app/controllers/login_controller.dart'; // 경로 수정

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: screenHeight * 0.75,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLoginButton(
                  assetName: 'assets/icons/naver_icon.svg',
                  text: '네이버 로그인',
                  backgroundColor: const Color(0xFF03C75A),
                  textColor: Colors.white,
                  onTap: controller.loginWithNaver,
                ),
                const SizedBox(height: 12),
                _buildLoginButton(
                  assetName: 'assets/icons/kakao_icon.svg',
                  text: '카카오 로그인',
                  backgroundColor: const Color(0xFFFEE500),
                  textColor: const Color(0xFF191919),
                  onTap: controller.loginWithKakao,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton({
    required String assetName,
    required String text,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 22.0),
                child: SvgPicture.asset(
                  assetName,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}