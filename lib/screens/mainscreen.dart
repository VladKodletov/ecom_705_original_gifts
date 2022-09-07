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

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //наброски на логику поиска
  // final _searchController = TextEditingController();

  // void _searchGoods() {
  //   final textEditing = _searchController.text;
  //   if (textEditing.isNotEmpty) {
  //     Row(
  //       children: [
  //         _ProductsCard
  //       ],
  //     );

  //   }
  // }
  // @override
  // void initState() {
  //   super.initState();
  //   _searchController.addListener(_searchGoods);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0ACF83),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (() {}),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Container(
                padding: EdgeInsets.only(left: 12, top: 12, bottom: 9.5),
                decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(65),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SelectCategory(
                          // children: const [
                          //   _CategoryText(
                          //     nameCategory: 'Wood gift',
                          //   ),
                          //   Padding(
                          //     padding: EdgeInsetsDirectional.only(end: 13),
                          //   ),
                          //   _CategoryText(
                          //     nameCategory: 'Personal gift',
                          //   ),
                          //   Padding(
                          //     padding: EdgeInsetsDirectional.only(end: 13),
                          //   ),
                          //   _CategoryText(
                          //     nameCategory: 'Wood jewelry',
                          //   ),
                          //   Padding(
                          //     padding: EdgeInsetsDirectional.only(end: 13),
                          //   ),
                          //   _CategoryText(
                          //     nameCategory: 'Tea cup',
                          //   ),
                          // ],
                          ),
                    ),
                    SizedBox(height: 15),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:  [
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: const [
                          _ProductsCard(
                            nameProduct: 'Wood toy "Car"',
                            nameProductIcon: Icons.toys_sharp,
                            priceProduct: '1150',
                          ),
                          _ProductsCard(
                            nameProduct: 'Wood toy №28',
                            nameProductIcon: Icons.toys_sharp,
                            priceProduct: '250',
                          ),
                          _ProductsCard(
                            nameProduct: 'Wood toy №9',
                            nameProductIcon: Icons.toys_sharp,
                            priceProduct: '450',
                          ),
                          _ProductsCard(
                            nameProduct: 'Wood toy №12',
                            nameProductIcon: Icons.toys_sharp,
                            priceProduct: '650',
                          ),
                          _ProductsCard(
                            nameProduct: 'Wood toy №8',
                            nameProductIcon: Icons.toys_sharp,
                            priceProduct: '350',
                          ),
                          _ProductsCard(
                            nameProduct: 'Wood toy №3',
                            nameProductIcon: Icons.toys_sharp,
                            priceProduct: '850',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
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

class SelectCategory extends StatefulWidget {
  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  final List<bool> _selectedCategory = <bool>[
    true,
    false,
    false,
    false,
  ];
  List<Widget> categoryText = [
    Text(
      'Wood gift',
    ),
    Text(
      'Personal gift',
    ),
    Text(
      'Wood jewelry',
    ),
    Text(
      'Tea cup',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    double widthCategory = MediaQuery.of(context).size.width * 0.28;
    double heightCategory = MediaQuery.of(context).size.width * 0.07;
    return ToggleButtons(
      onPressed: (index) {
        setState(() {
          for (int i = 0; i < _selectedCategory.length; i++) {
            _selectedCategory[i] = i == index;
          }
        });
      },
      renderBorder: false,
      constraints:
          BoxConstraints(minWidth: widthCategory, minHeight: heightCategory),
      selectedColor: Colors.white,
      fillColor: Color(0xFF0ACF83),
      isSelected: _selectedCategory,
      children: categoryText,
    );
  }
}

class _UnderCategoryCard extends StatelessWidget {
  final String nameUnderCategory;
  String picturesUnderCategory;

  _UnderCategoryCard({
    required this.nameUnderCategory,
    required this.picturesUnderCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
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
            borderRadius: BorderRadius.circular(24),
            child: Image.network(
              picturesUnderCategory,
              width: MediaQuery.of(context).size.width * 0.40,
              height: MediaQuery.of(context).size.height * 0.40,
              fit: BoxFit.cover,
              
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductsCard extends StatelessWidget {
  final IconData nameProductIcon;
  final String nameProduct;
  final String priceProduct;

  const _ProductsCard({
    required this.nameProductIcon,
    required this.nameProduct,
    required this.priceProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(6),
          width: MediaQuery.of(context).size.width * 0.42,
          height: MediaQuery.of(context).size.height * 0.20,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                nameProductIcon,
                size: 80,
              ),
              Text(
                nameProduct,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                'RUB $priceProduct',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
