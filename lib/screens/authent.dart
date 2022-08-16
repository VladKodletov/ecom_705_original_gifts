import 'package:flutter/material.dart';

class ScreenAuth extends StatefulWidget {
  const ScreenAuth({Key? key}) : super(key: key);

  @override
  State<ScreenAuth> createState() => _ScreenAuthState();
}

class _ScreenAuthState extends State<ScreenAuth> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('705 Shop'),
      ),
    );
  }
}
