import 'package:flutter/material.dart';


class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.green,
                Color(0xFF0ACF83),
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'Корзина',
          style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
