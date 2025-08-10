// lib/app/controllers/login_controller.dart

import 'package:conte/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_login/interface/types/naver_login_result.dart';
import 'package:flutter_naver_login/interface/types/naver_login_status.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart'; // [필수!] 이 import 구문이 있는지 꼭 확인하세요.
import 'package:conte/app/data/models/social_user.dart';
import 'package:conte/app/utils/error_handler.dart';

class LoginController extends GetxController {
  final isLoading = false.obs;

  void loginWithNaver() async {
    try {
      final NaverLoginResult result = await FlutterNaverLogin.logIn();

      if (result.status == NaverLoginStatus.loggedIn) {
        final user = SocialUser(
          nickname: result.account?.nickname,
          profileImageUrl: result.account?.profileImage,
        );
        _handleLoginSuccess(user);
      } else {
        final errorMessage = result.errorMessage ?? "알 수 없는 오류가 발생했습니다.";
        debugPrint('네이버 로그인 실패: ${result.status}, $errorMessage');
        Get.snackbar("로그인 실패", errorMessage,
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (error) {
      final errorMessage = ErrorHandler.getErrorMessage(error);
      debugPrint('네이버 로그인 중 예외 발생: $error');
      Get.snackbar("로그인 오류", errorMessage,
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  // (카카오 로그인 관련 코드는 이전과 동일)
  void loginWithKakao() async {
    if (await isKakaoTalkInstalled()) {
      try {
        await UserApi.instance.loginWithKakaoTalk();
        debugPrint('카카오톡으로 로그인 성공');
        _handleKakaoLoginSuccess();
      } catch (error) {
        debugPrint('카카오톡으로 로그인 실패 $error');
        if (error is PlatformException && error.code == 'CANCELED') {
          return;
        }
        await _loginWithKakaoAccount();
      }
    } else {
      await _loginWithKakaoAccount();
    }
  }

  Future<void> _loginWithKakaoAccount() async {
    try {
      await UserApi.instance.loginWithKakaoAccount();
      debugPrint('카카오계정으로 로그인 성공');
      _handleKakaoLoginSuccess();
    } catch (error) {
      final errorMessage = ErrorHandler.getErrorMessage(error);
      debugPrint('카카오계정으로 로그인 실패 $error');
      Get.snackbar("로그인 실패", errorMessage,
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  void _handleKakaoLoginSuccess() async {
    try {
      User user = await UserApi.instance.me();
      final socialUser = SocialUser(
        nickname: user.kakaoAccount?.profile?.nickname,
        profileImageUrl: user.kakaoAccount?.profile?.profileImageUrl,
      );
      _handleLoginSuccess(socialUser);
    } catch (error) {
      final errorMessage = ErrorHandler.getErrorMessage(error);
      debugPrint('카카오 사용자 정보 요청 실패 $error');
      Get.snackbar("정보 로딩 실패", errorMessage,
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  void _handleLoginSuccess(SocialUser user) {
    debugPrint('로그인 성공!');
    debugPrint('닉네임: ${user.nickname}');
    debugPrint('프로필 이미지 URL: ${user.profileImageUrl}');

    Get.offAllNamed(Routes.home, arguments: user);
  }
}