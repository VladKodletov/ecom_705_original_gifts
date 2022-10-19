import 'package:flutter/material.dart';

import '../screens/authent_screen.dart';
import '../screens/reg_authent_screen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin ? const HeaderPage() : const RegScreenAuth();

  void toggle() => setState(() {
    isLogin = !isLogin;
  });
}
