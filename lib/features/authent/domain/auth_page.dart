import 'package:flutter/material.dart';

import '../presentation/authent_screen.dart';
import '../../registration/presentation/reg_authent_screen.dart';

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
