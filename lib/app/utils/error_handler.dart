// lib/app/utils/error_handler.dart

import 'package:flutter/services.dart';

class ErrorHandler {
  /// 오류 객체를 받아 사용자에게 보여줄 친절한 메시지를 반환합니다.
  static String getErrorMessage(dynamic error) {
    if (error is PlatformException) {
      // 네이티브 코드(Android/iOS)에서 발생한 오류 처리
      switch (error.code) {
        case 'CANCELED':
          return '로그인이 취소되었습니다.';
      // 추가적인 네이티브 오류 코드를 여기에 정의할 수 있습니다.
        default:
          return '로그인 중 오류가 발생했습니다. (네이티브)';
      }
    } else {
      // 일반 Dart 또는 서버 통신 오류 처리
      // 여기서는 간단하게 하나의 메시지만 반환하지만,
      // error의 타입을 확인하여(예: if (error is DioError)) 더 세분화할 수 있습니다.
      return '일시적인 오류가 발생했습니다. 잠시 후 다시 시도해주세요.';
    }
  }
}