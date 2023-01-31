// ignore_for_file: must_be_immutable

import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import 'package:ecom_705_original_gifts/features/mainscreen/presentation/widgets/mini_products.dart';
import 'package:ecom_705_original_gifts/features/product/presentation/widgets/tab_overview.dart';
import 'package:ecom_705_original_gifts/features/shopping_cart/presentation/shopping_cart_screen.dart';

class ProductScreen extends StatefulWidget {
  final String idProductScreen;
  final double priceProductScreen;
  final String titleProductScreen;
  final double amountProductScreen;
  final String firstImageUrlProductScreen;
  final String secondImageUrlProductScreen;
  final String thirdImageUrlProductScreen;
  final String descriptionProductScreen;
  bool isFavoriteProductScreen;

  ProductScreen(
      {super.key,
      required this.idProductScreen,
      required this.priceProductScreen,
      required this.titleProductScreen,
      required this.amountProductScreen,
      required this.firstImageUrlProductScreen,
      this.secondImageUrlProductScreen = '',
      this.thirdImageUrlProductScreen = '',
      this.descriptionProductScreen = '',
      this.isFavoriteProductScreen = false});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with SingleTickerProviderStateMixin {
  Future addToCart() async {
    final auth = FirebaseAuth.instance;
    var currentUser = auth.currentUser;
    CollectionReference collectionCart =
        FirebaseFirestore.instance.collection('users_cart');
    return collectionCart
        .doc(currentUser!.email)
        .collection('productsCart')
        .doc()
        .set({
      'name': widget.titleProductScreen,
      'price': widget.priceProductScreen,
      'image': widget.firstImageUrlProductScreen,
    });
  }

  late final _tabController = TabController(length: 2, vsync: this);
  Icon iconsFavorite = const Icon(Icons.favorite);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users_cart')
                  .doc(FirebaseAuth.instance.currentUser!.email)
                  .collection('productsCart')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                String shopCartCount = (snapshot.data?.size ?? 0).toString();
                return Badge(
                  showBadge: shopCartCount == '0' ? false : true,
                  position: BadgePosition.bottomEnd(bottom: 30, end: 0),
                  badgeContent: Text((snapshot.data?.size ?? 0).toString()),
                  child: IconButton(
                    icon: const Icon(Icons.shopping_cart_outlined),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ShoppingCartScreen()),
                      );
                    },
                  ),
                );
              })
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    top: 25,
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'RUB ${widget.priceProductScreen}',
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0ACF83),
                                  ),
                                ),
                                Text(
                                  widget.titleProductScreen,
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  widget.isFavoriteProductScreen =
                                      !widget.isFavoriteProductScreen;
                                  setState(() {});
                                },
                                icon: widget.isFavoriteProductScreen
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    : const Icon(
                                        Icons.favorite_border,
                                      ))
                          ],
                        ),
                      ),
                      DefaultTabController(
                        length: 2,
                        child: TabBar(
                          controller: _tabController,
                          padding: const EdgeInsets.only(
                            bottom: 10,
                          ),
                          indicatorColor: const Color(0xFF0ACF83),
                          tabs: const [
                            Tab(
                              text: "Overview",
                            ),
                            Tab(
                              text: "Features",
                            ),
                          ],
                          labelColor: Colors.black,
                          indicator: MaterialIndicator(
                            height: 5,
                            topLeftRadius: 8,
                            bottomLeftRadius: 8,
                            bottomRightRadius: 8,
                            topRightRadius: 8,
                            horizontalPadding: 50,
                            color: const Color(0xFF0ACF83),
                            tabPosition: TabPosition.bottom,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            TabOverview(
                              imageFirst: widget.firstImageUrlProductScreen,
                              imageSecond: widget.secondImageUrlProductScreen,
                              imageThird: widget.thirdImageUrlProductScreen,
                            ),
                            SizedBox(
                              child: Text(
                                widget.descriptionProductScreen,
                                textAlign: TextAlign.start,
                                style: const TextStyle(fontSize: 32),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 40),
                  color: Colors.black12,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 8, right: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Another Product'),
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.black38),
                              ),
                              onPressed: () {},
                              child: const Text('See all'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: MiniProducts(),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromHeight(35),
                  backgroundColor: const Color(0xFF0ACF83),
                ),
                onPressed: addToCart,
                child: const Text(
                  'Add to cart',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
