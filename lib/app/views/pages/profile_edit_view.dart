import 'package:flutter/material.dart';

class ProfileEditView extends StatelessWidget {
  const ProfileEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('정보 수정'),
      ),
      body: const Center(
        child: Text(
          '정보 수정 페이지',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}