import 'package:flutter/material.dart';

import 'package:ecom_705_original_gifts/features/catalog/presentation/catalog_screen.dart';
import 'package:ecom_705_original_gifts/features/profile/presentation/profile_screen.dart';
import 'package:ecom_705_original_gifts/features/shopping_cart/presentation/shopping_cart_screen.dart';
import 'package:ecom_705_original_gifts/features/mainscreen/presentation/main_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;
  final screensNavigation = [
    const MainScreen(),
    const CatalogScreen(),
    const ShoppingCartScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screensNavigation[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            backgroundColor: const Color.fromARGB(255, 205, 255, 236),
            labelTextStyle: MaterialStateProperty.all(
              const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            )),
        child: NavigationBar(
            height: 60,
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: const [
              NavigationDestination(
                icon: Icon(
                  Icons.home_outlined,
                ),
                selectedIcon: Icon(Icons.home, size: 32),
                label: 'Main',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.format_indent_increase_outlined,
                ),
                selectedIcon: Icon(
                  Icons.format_indent_increase,
                  size: 32,
                ),
                label: 'Catalog',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                ),
                selectedIcon: Icon(
                  Icons.shopping_bag,
                  size: 32,
                ),
                label: 'Shop cart',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.account_circle_outlined,
                ),
                selectedIcon: Icon(
                  Icons.account_circle,
                  size: 32,
                ),
                label: 'Profile',
              ),
            ]),
      ),
    );
  }
}
