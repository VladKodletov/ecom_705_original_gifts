import 'package:flutter/material.dart';

class ScreenAuth extends StatefulWidget {
  const ScreenAuth({Key? key}) : super(key: key);

  @override
  State<ScreenAuth> createState() => _ScreenAuthState();
}

class _ScreenAuthState extends State<ScreenAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[600],
      // appBar: AppBar(
      //   title: const Text('App Shop'),
      // ),
      body: const HeaderPage(),
    );
  }
}

class HeaderPage extends StatelessWidget {
  const HeaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          SizedBox(
            height: 120,
          ),
          Text(
            '705',
            style: TextStyle(
                fontSize: 52, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'original gifts',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          SizedBox(
            height: 130,
          ),
          AuthInputForm(),
        ],
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              prefixIcon: const Icon(
                Icons.mail_outline,
              ),
              label: const Text('Email'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              )),
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefixIcon: const Icon(
              Icons.lock,
            ),
            label: const Text('Password'),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const Text(
          'Forgot Password?',
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 12,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF0ACF83),
          ),
          onPressed: () {},
          child: const Text('Sign In'),
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
              onPressed: () {},
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
}
