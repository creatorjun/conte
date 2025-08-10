import 'package:flutter/material.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          '정보 페이지',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}