import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:ecom_705_original_gifts/core/service/utils.dart';
import 'package:ecom_705_original_gifts/main.dart';

class AuthentInputForm extends StatefulWidget {
  const AuthentInputForm({super.key});

  @override
  State<AuthentInputForm> createState() => _AuthentInputFormState();
}

class _AuthentInputFormState extends State<AuthentInputForm> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void _forgotPassword() {
    Navigator.of(context).pushNamed('/restore_password');
  }

  void _register() {
    Navigator.of(context).pushNamed('/reg_screen');
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: emailController,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              prefixIcon: const Icon(
                Icons.mail_outline,
              ),
              hintText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              )),
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefixIcon: const Icon(
              Icons.lock,
            ),
            hintText: 'Password',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextButton(
          onPressed: _forgotPassword,
          child: const Text(
            'Forgot Password',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromHeight(55),
                backgroundColor: const Color(0xFF0ACF83),
              ),
              onPressed: signIn,

              /// _mainScreen,
              child: const Text(
                'Sign In',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Didn't have any account?",
                style: TextStyle(color: Colors.white)),
            const SizedBox(),
            TextButton(
              onPressed: _register,
              child: const Text(
                'Sign Up here',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future signIn() async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
