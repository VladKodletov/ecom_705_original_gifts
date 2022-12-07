import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'features/authent/presentation/authent_screen.dart';
import 'features/registration/presentation/reg_authent_screen.dart';
import 'features/restore_password/presentation/restore_password_screen.dart';
import 'features/mainscreen/presentation/widgets/bottom_nav_bar.dart';

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
