// lib/login_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 화면의 전체 높이를 가져옵니다.
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            // 화면 상단에서 75% 위치에 버튼들을 배치합니다.
            top: screenHeight * 0.75,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 네이버 로그인 버튼
                _buildLoginButton(
                  assetName: 'assets/icons/naver_icon.svg',
                  text: '네이버 로그인',
                  backgroundColor: const Color(0xFF03C75A),
                  textColor: Colors.white,
                ),
                const SizedBox(height: 12), // 버튼 사이 간격
                // 카카오 로그인 버튼
                _buildLoginButton(
                  assetName: 'assets/icons/kakao_icon.svg',
                  text: '카카오 로그인',
                  backgroundColor: const Color(0xFFFEE500),
                  textColor: const Color(0xFF191919),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 로그인 버튼을 만드는 위젯
  Widget _buildLoginButton({
    required String assetName,
    required String text,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return Container(
      width: 300, // 버튼 너비
      height: 50, // 버튼 높이
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      // Stack을 사용하여 위젯들을 겹치게 배치합니다.
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 아이콘을 왼쪽에 배치합니다.
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              // 아이콘 왼쪽에 여백을 줍니다.
              padding: const EdgeInsets.only(left: 22.0),
              child: SvgPicture.asset(
                assetName,
                width: 24,
                height: 24,
              ),
            ),
          ),
          // 텍스트는 Stack의 정중앙에 위치합니다.
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
    );
  }
}