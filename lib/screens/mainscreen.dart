import 'profile.dart';
import 'package:flutter/material.dart';

import 'catalog.dart';
import 'shopping_cart.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Главная')),
    );
  }
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  final screensNavigation = [
    MainScreen(),
    CatalogScreen(),
    ProfileScreen(),
    ShoppingCart(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screensNavigation[index],
      bottomNavigationBar: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: ((index) => index),
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Главная',
            ),
            NavigationDestination(
              icon: Icon(Icons.format_indent_increase),
              label: 'Каталог',
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_bag),
              label: 'Корзина',
            ),
            NavigationDestination(
              icon: Icon(Icons.account_circle),
              label: 'Профиль',
            ),
          ]),
    );
  }
}
