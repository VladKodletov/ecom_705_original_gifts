// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../widgets/mini_products.dart';
import 'profile_screen.dart';
import 'catalog_screen.dart';
import 'shopping_cart_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
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
            backgroundColor: Color.fromARGB(255, 205, 255, 236),
            labelTextStyle: MaterialStateProperty.all(
              TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            )),
        child: NavigationBar(
            height: 60,
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

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var email = FirebaseAuth.instance.currentUser!.email.toString();
  @override
  Widget build(BuildContext context) {
    ///ниже dead code?
    // void productScreen() {
    //   Navigator.of(context).pushNamed('/productscreen');
    // }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Signed in as $email',
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [
                Colors.green,
                Color(0xFF0ACF83),
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            // padding: EdgeInsets.only(
            //   top: 70,
            //   left: 8,
            // ),
            child: Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.72,
              ),
              padding: EdgeInsets.only(
                left: 12,
                top: 70,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.withAlpha(40),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Column(
                children: [
                  SelectCat(),
                  SizedBox(height: 15),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                        _UnderCategoryCard(
                          nameUnderCategory: 'Wood kitchen board',
                          picturesUnderCategory:
                              'https://i.ibb.co/6ZbnbxG/2.jpg',
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        _UnderCategoryCard(
                          nameUnderCategory: 'Wood toys',
                          picturesUnderCategory:
                              'https://i.ibb.co/2gdzgm7/5.jpg',
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        _UnderCategoryCard(
                          nameUnderCategory: 'Wood picture',
                          picturesUnderCategory:
                              'https://i.ibb.co/F0rBHxk/9.jpg',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Featured Products'),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'See all',
                          style: TextStyle(color: Colors.black38),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  MiniOverviewProducts(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
            child: TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
                fillColor: Colors.white.withAlpha(230),
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 6,
          )
        ],
      ),
    );
  }
}

class SelectCat extends StatefulWidget {
  const SelectCat({super.key});

  @override
  State<SelectCat> createState() => _SelectCatState();
}

class _SelectCatState extends State<SelectCat> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: TabBar(
        labelPadding: EdgeInsets.symmetric(horizontal: 19),
        isScrollable: true,
        tabs: const [
          Tab(
            text: 'Wood gift',
          ),
          Tab(
            text: 'Personal gift',
          ),
          Tab(
            text: 'Wood jewelry',
          ),
          Tab(
            text: 'Tea cup',
          ),
        ],
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey.shade500,
        indicator: RectangularIndicator(
          topLeftRadius: 16,
          bottomLeftRadius: 16,
          bottomRightRadius: 16,
          topRightRadius: 16,
          horizontalPadding: 6,
          verticalPadding: 12,
          color: const Color(0xFF0ACF83),
        ),
      ),
    );
  }
}

class _UnderCategoryCard extends StatelessWidget {
  final String nameUnderCategory;
  final String picturesUnderCategory;

  const _UnderCategoryCard({
    required this.nameUnderCategory,
    required this.picturesUnderCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(4),
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.25,
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              // ignore: sized_box_for_whitespace
              Container(
                width: MediaQuery.of(context).size.width * 0.35,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ignore: sized_box_for_whitespace
                    Container(
                      width: MediaQuery.of(context).size.width * 0.24,
                      height: MediaQuery.of(context).size.height * 0.14,
                      child: Text(
                        nameUnderCategory,
                        style: TextStyle(
                          fontSize: 28,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      alignment: AlignmentDirectional.bottomStart,
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: const [
                                Text(
                                  'Shop now',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF0ACF83),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.arrow_circle_right_outlined,
                                  color: Color(0xFF0ACF83),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  picturesUnderCategory,
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.32,
                  fit: BoxFit.cover,
                  scale: 0.8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
