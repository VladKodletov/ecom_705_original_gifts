import 'package:ecom_705_original_gifts/features/authent/presentation/widgets/header_widget.dart';
import 'package:flutter/material.dart';

import 'package:ecom_705_original_gifts/features/registration/presentation/reg_authent_screen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) =>
      isLogin ? const HeaderWidget() : const RegAuthentScreen();

  void toggle() => setState(() {
        isLogin = !isLogin;
      });
}
