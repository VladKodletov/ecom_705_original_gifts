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
      appBar: AppBar(
        title: const Text('App Shop'),
      ),
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
        children: const [
          SizedBox(
            height: 60,
          ),
          Text(
            '705',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'original gifts',
            style: TextStyle(fontSize: 18),
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
        const Text('Forgot Password?'),
        const SizedBox(
          height: 12,
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Sign In'),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Didn't have any account?"),
            const SizedBox(
              width: 4,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Sign Up'),
            ),
          ],
        )
      ],
    );
  }
}
