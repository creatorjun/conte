// lib/main.dart

import 'package:flutter/material.dart';
import 'package:conte/login_screen.dart'; // 로그인 화면 import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conte Coffee',//app
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      // 시작 화면을 LoginScreen으로 변경합니다.
      // 네이티브 스플래시가 적용되어 있으므로 플러터 스플래시 화면은 필요 없습니다.
      home: const LoginScreen(),
    );
  }
}