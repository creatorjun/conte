import 'package:flutter/material.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          '주문 페이지',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}