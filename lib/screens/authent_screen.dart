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
      body: const HeaderPage(),
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
  void _forgotPassword() {
    Navigator.of(context).pushNamed('/restore_password');
  }

  void _register() {
    Navigator.of(context).pushNamed('/reg_screen');
  }

  void _mainScreen() {
    Navigator.of(context).pushNamed('/mainscreen');
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
              onPressed: _mainScreen,
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
}
