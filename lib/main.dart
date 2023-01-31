import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:ecom_705_original_gifts/core/router/router.dart';

import 'features/registration/presentation/reg_authent_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: '/',
      theme: ThemeData(),
    ),
  );
}
