import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/authent_screen.dart';
import 'screens/reg_authent_screen.dart';
import 'screens/restore_password_screen.dart';
import 'widgets/bottom_nav_bar.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const ScreenAuth(),
        '/reg_screen': (context) => const RegScreenAuth(),
        '/restore_password': (context) => const ResetPassword(),
        '/mainscreen': (context) => const BottomNavBar(),
      },
      initialRoute: '/',
      theme: ThemeData(),
    ),
  );
}
