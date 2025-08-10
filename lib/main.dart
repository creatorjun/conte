// lib/main.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'app/routes/app_pages.dart';

void main() async {
  // main() 함수를 비동기 방식으로 변경합니다.
  WidgetsFlutterBinding.ensureInitialized(); // Flutter 엔진과 위젯 바인딩을 초기화합니다.

  // Kakao SDK를 초기화합니다.
  KakaoSdk.init(
    nativeAppKey: 'dd2b45aaf3d1569eab81542a5ed7c59d',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Conte Coffee',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      initialRoute: Routes.login,
      getPages: AppPages.routes,
    );
  }
}