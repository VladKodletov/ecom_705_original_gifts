// ignore_for_file: prefer_const_constructors

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
        actions: const [
          Icon(Icons.search),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Text('place for search widget'),
          SizedBox(
            height: 150,
          ),
          Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    _CategoryText(
                      nameCategory: 'Wood gift',
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(end: 13),
                    ),
                    _CategoryText(
                      nameCategory: 'Personal gift',
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(end: 13),
                    ),
                    _CategoryText(
                      nameCategory: 'Wood gift',
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(end: 13),
                    ),
                    _CategoryText(
                      nameCategory: 'Tea cup',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    _UnderCategoryCard(
                      nameUnderCategory: 'Wood deck',
                      nameIcon: Icons.wallet_giftcard_rounded,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    _UnderCategoryCard(
                      nameUnderCategory: 'Wood toys',
                      nameIcon: Icons.toys_outlined,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    _UnderCategoryCard(
                      nameUnderCategory: 'Wood picture',
                      nameIcon: Icons.photo_size_select_actual_outlined,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Featured Products'),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('See all'),
                  ),
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

class _CategoryText extends StatelessWidget {
  final String nameCategory;

  const _CategoryText({required this.nameCategory});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Color(0xFF0ACF83),
        ),
      ),
      onPressed: () {},
      child: Text(
        nameCategory,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class _UnderCategoryCard extends StatelessWidget {
  final String nameUnderCategory;
  final IconData nameIcon;

  const _UnderCategoryCard(
      {required this.nameUnderCategory, required this.nameIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Row(
        children: [
          Column(
            children: [
              Text(nameUnderCategory, style: TextStyle(fontSize: 35),),
              Row(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xFF0ACF83),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Shop now',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Icon(nameIcon, size: 45,),
          SizedBox(width: 30,)
        ],
      ),
    );
  }
}
