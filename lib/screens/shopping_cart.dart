import 'package:flutter/material.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0ACF83),
      ),
      body: Center(
        child: Text(
          'Корзина',
          style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
