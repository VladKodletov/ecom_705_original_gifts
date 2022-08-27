// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';

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
      appBar: AppBar(
        backgroundColor: const Color(0xFF0ACF83),
        actions: [
          Icon(Icons.search),
        ],
      ),
      body: Column(
        children: [
          Text('for search widget'),
          Column(
            children: [
              Row(),
              ListView(),
              Row(
                children: [
                  Text('Featured Products'),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('See all'),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  final screensNavigation = [
    MainScreen(),
    CatalogScreen(),
    ShoppingCart(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screensNavigation[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            backgroundColor: Color.fromARGB(255, 151, 247, 210),
            labelTextStyle: MaterialStateProperty.all(
              TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            )),
        child: NavigationBar(
            height: 60,
            // animationDuration: Duration(seconds: 2),
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            // ignore: prefer_const_literals_to_create_immutables
            destinations: [
              NavigationDestination(
                icon: Icon(
                  Icons.home_outlined,
                ),
                selectedIcon: Icon(Icons.home, size: 32),
                label: 'Главная',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.format_indent_increase_outlined,
                ),
                selectedIcon: Icon(
                  Icons.format_indent_increase,
                  size: 32,
                ),
                label: 'Каталог',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                ),
                selectedIcon: Icon(
                  Icons.shopping_bag,
                  size: 32,
                ),
                label: 'Корзина',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.account_circle_outlined,
                ),
                selectedIcon: Icon(
                  Icons.account_circle,
                  size: 32,
                ),
                label: 'Профиль',
              ),
            ]),
      ),
    );
  }
}
