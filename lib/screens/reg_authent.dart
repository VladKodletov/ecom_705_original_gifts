import 'package:flutter/material.dart';

import 'authent.dart';

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
      // appBar: AppBar(
      //   title: const Text('App Shop'),
      // ),
      body: const RegHeaderPage(),
    );
  }
}

class RegHeaderPage extends StatelessWidget {
  const RegHeaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ListView(
        children: const [
          SizedBox(
            height: 120,
          ),
          Text(
            '705',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 52, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'original gifts',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          SizedBox(
            height: 80,
          ),
          RegAuthInputForm(),
        ],
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
          height: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size.fromHeight(55),
                primary: const Color(0xFF0ACF83),
              ),
              onPressed: () {},
              child: const Text('Sign Up', style: TextStyle(fontSize: 20),),
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
              onPressed: () => const ScreenAuth(),
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
}
