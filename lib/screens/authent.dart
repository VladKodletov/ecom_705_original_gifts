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
        title: Text('App Shop'),
      ),
      body: HeaderPage(),
    );
  }
}

class HeaderPage extends StatelessWidget {
  const HeaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Text(
            '705 original gifts',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 100,
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
              label: Text('Email'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              )),
        ),
        SizedBox(
          height: 16,
        ),
        TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.lock,
            ),
            label: Text('Password'),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Text('Forgot Password?'),
        SizedBox(
          height: 12,
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('Sign In'),
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Didn't have any account?"),
            ElevatedButton(
              onPressed: () {},
              child: Text('Sign Up'),
            ),
          ],
        )
      ],
    );
  }
}
