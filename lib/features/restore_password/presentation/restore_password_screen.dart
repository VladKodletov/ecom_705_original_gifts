import 'package:flutter/material.dart';

import 'package:ecom_705_original_gifts/features/restore_password/presentation/widgets/input_email_form.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.45), BlendMode.darken),
          image: const AssetImage(
            'assets/image/background.jpg',
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
        body: Padding(
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
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0ACF83),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'original gifts',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF0ACF83),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              InputEmailForm(),
            ],
          ),
        ),
      ),
    );
  }
}
