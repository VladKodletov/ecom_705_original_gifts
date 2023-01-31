import 'package:ecom_705_original_gifts/features/registration/presentation/widgets/reg_authent_input_form.dart';
import 'package:flutter/material.dart';

class RegHeaderWidget extends StatelessWidget {
  const RegHeaderWidget({Key? key}) : super(key: key);

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
              fontSize: 56,
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
              fontSize: 20,
              color: Color(0xFF0ACF83),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          RegAuthentInputForm(),
        ],
      ),
    );
  }
}
