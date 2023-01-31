import 'package:ecom_705_original_gifts/core/service/utils.dart';
import 'package:ecom_705_original_gifts/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegAuthentInputForm extends StatefulWidget {
  const RegAuthentInputForm({Key? key}) : super(key: key);

  @override
  State<RegAuthentInputForm> createState() => _RegAuthentInputFormState();
}

class _RegAuthentInputFormState extends State<RegAuthentInputForm> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  void _authent() {
    Navigator.of(context).pushNamed('/');
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
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
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        TextFormField(
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
          height: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromHeight(55),
                backgroundColor: const Color(0xFF0ACF83),
              ),
              onPressed: signUp,
              child: const Text(
                'Sign Up',
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
            const Text(
              "If you have an account?",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(),
            TextButton(
              onPressed: _authent,
              child: const Text(
                'Sign In here',
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

  Future signUp() async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }
  }
}
