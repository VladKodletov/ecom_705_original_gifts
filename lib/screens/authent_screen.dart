import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'main_screen.dart';

class ScreenAuth extends StatefulWidget {
  const ScreenAuth({Key? key}) : super(key: key);

  @override
  State<ScreenAuth> createState() => _ScreenAuthState();
}

final navigatorKey = GlobalKey<NavigatorState>();


class _ScreenAuthState extends State<ScreenAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[600],
      // appBar: AppBar(
      //   flexibleSpace: Container(
      //     decoration: const BoxDecoration(
      //       gradient: LinearGradient(
      //         colors: [
      //           Colors.green,
      //           Color(0xFF0ACF83),
      //         ],
      //         begin: Alignment.bottomRight,
      //         end: Alignment.topLeft,
      //       ),
      //     ),
      //   ),
      // ),
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Что-то пошло не так, сорюшки'),
            );
          } else if (snapshot.hasData) {
            return const MainPage();
          } else {
            return const HeaderPage();
          }
        },
      ),
    );
  }
}

class HeaderPage extends StatelessWidget {
  const HeaderPage({Key? key}) : super(key: key);

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
                color: Colors.white,
              ),
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
            AuthInputForm(),
          ],
        ),
      ),
    );
  }
}

class AuthInputForm extends StatefulWidget {
  const AuthInputForm({Key? key}) : super(key: key);

  @override
  State<AuthInputForm> createState() => _AuthInputFormState();
}

class _AuthInputFormState extends State<AuthInputForm> {
  var passwordController = TextEditingController();
  var emailController = TextEditingController();

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

  // void _mainScreen() {
  //   Navigator.of(context).pushNamed('/mainscreen');
  // }

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
                style: TextStyle(fontSize: 18),
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
                  color: Color(0xFF0ACF83),
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
      print(e);
      
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
  
}
