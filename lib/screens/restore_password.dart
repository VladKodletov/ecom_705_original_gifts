import 'package:flutter/material.dart';

import 'authent.dart';

class RestorePassword extends StatefulWidget {
  const RestorePassword({Key? key}) : super(key: key);

  @override
  State<RestorePassword> createState() => _RestorePasswordState();
}

class _RestorePasswordState extends State<RestorePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: 
      // Colors.teal[600],
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
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
      body: const RestPassPage(),
    );
  }
}

class RestPassPage extends StatelessWidget {
  const RestPassPage({Key? key}) : super(key: key);

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
              height: 120,
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
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(
              height: 80,
            ),
            InputEmailForm(),
          ],
        ),
      ),
    );
  }
}

class InputEmailForm extends StatefulWidget {
  const InputEmailForm({Key? key}) : super(key: key);

  @override
  State<InputEmailForm> createState() => _InputEmailFormState();
}

class _InputEmailFormState extends State<InputEmailForm> {
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
              hintText: 'Enter email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              )),
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
              child: const Text(
                'Restore password',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
