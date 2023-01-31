import 'package:flutter/material.dart';

import 'package:ecom_705_original_gifts/features/authent/presentation/widgets/authent_input_form.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0ACF83),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'original gifts',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Color(0xFF0ACF83),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          AuthentInputForm(),
        ],
      ),
    );
  }
}
