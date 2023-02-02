import 'package:flutter/material.dart';

import 'package:ecom_705_original_gifts/features/registration/presentation/widgets/reg_header_widget.dart';

class RegAuthentScreen extends StatefulWidget {
  const RegAuthentScreen({Key? key}) : super(key: key);

  @override
  State<RegAuthentScreen> createState() => _RegAuthentScreenState();
}

class _RegAuthentScreenState extends State<RegAuthentScreen> {
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
        body: const RegHeaderWidget(),
      ),
    );
  }
}


