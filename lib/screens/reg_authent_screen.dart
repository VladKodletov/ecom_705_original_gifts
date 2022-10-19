import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(
      content: Text(text, textAlign: TextAlign.center),
      backgroundColor: Colors.red,
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

class RegScreenAuth extends StatefulWidget {
  const RegScreenAuth({Key? key}) : super(key: key);

  @override
  State<RegScreenAuth> createState() => _RegScreenAuthState();
}

class _RegScreenAuthState extends State<RegScreenAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[600],
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
      body: const RegHeaderPage(),
    );
  }
}

class RegHeaderPage extends StatelessWidget {
  const RegHeaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.green.shade900,
            Colors.green,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: const [
            SizedBox(
              height: 80,
            ),
            Text(
              '705',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 52,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'original gifts',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 80,
            ),
            RegAuthInputForm(),
          ],
        ),
      ),
    );
  }
}

class RegAuthInputForm extends StatefulWidget {
  const RegAuthInputForm({Key? key}) : super(key: key);

  @override
  State<RegAuthInputForm> createState() => _RegAuthInputFormState();
}

class _RegAuthInputFormState extends State<RegAuthInputForm> {
  // final formKey = GlobalKey<FormState>();
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
          // textInputAction: TextInputAction.next,
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          // validator: (email) {
          //   email != null && !EmailValidator.validate(email)
          //       ? 'Enter a valid email'
          //       : null;
          // },
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
          // obscureText: true,
          // textInputAction: TextInputAction.next,
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          // validator: (value) {
          //   value != null && value.length < 6
          //       ? 'Enter min. 6 characters'
          //       : null;
          // },
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
            const Text("If you have an account?",
                style: TextStyle(color: Colors.white)),
            const SizedBox(),
            TextButton(
              onPressed: _authent,
              child: const Text(
                'Sign In here',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Color(0xFF0ACF83),
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
    } on FirebaseAuthException catch (e) {

      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
