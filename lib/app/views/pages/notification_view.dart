import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          '알림 페이지',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}