import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:ecom_705_original_gifts/features/authent/presentation/widgets/header_widget.dart';
import 'package:ecom_705_original_gifts/features/mainscreen/presentation/widgets/bottom_nav_bar.dart';

class AuthentScreen extends StatefulWidget {
  const AuthentScreen({super.key});

  @override
  State<AuthentScreen> createState() => _AuthentScreenState();
}

class _AuthentScreenState extends State<AuthentScreen> {
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
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const BottomNavBar();
            } else {
              return const HeaderWidget();
            }
          },
        ),
      ),
    );
  }
}
