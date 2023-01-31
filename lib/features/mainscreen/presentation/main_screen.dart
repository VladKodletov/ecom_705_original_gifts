import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_705_original_gifts/features/shopping_cart/presentation/shopping_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import 'widgets/custom_scroll_view.dart';
import 'widgets/mini_products.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 4, vsync: this);
  var email = FirebaseAuth.instance.currentUser!.email.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () => FirebaseAuth.instance.signOut(),
        ),
        centerTitle: true,
        title: Text(
          'Signed in as $email',
        ),
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
                            builder: (context) => const ShoppingCart()),
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
          Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(
              left: 12,
              top: 70,
            ),
            decoration: BoxDecoration(
              color: Colors.grey.withAlpha(40),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DefaultTabController(
                    length: 4,
                    initialIndex: 0,
                    child: TabBar(
                      controller: _tabController,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 19),
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
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.30,
                    child: TabBarView(
                      controller: _tabController,
                      children: const [
                        MyCustomScrollView(
                          firstNameCard: 'Wood gift board',
                          firstSourcePicture: 'https://i.ibb.co/6ZbnbxG/2.jpg',
                          secondNameCard: 'Wood gift toys',
                          secondSourcePicture: 'https://i.ibb.co/2gdzgm7/5.jpg',
                          thirdNameCard: 'Wood gift picture',
                          thirdSourcePicture: 'https://i.ibb.co/F0rBHxk/9.jpg',
                        ),
                        MyCustomScrollView(
                          firstNameCard: 'Personal toys',
                          firstSourcePicture: 'https://i.ibb.co/2gdzgm7/5.jpg',
                          secondNameCard: 'Personal kitchen board',
                          secondSourcePicture: 'https://i.ibb.co/6ZbnbxG/2.jpg',
                          thirdNameCard: 'Personal picture',
                          thirdSourcePicture: 'https://i.ibb.co/F0rBHxk/9.jpg',
                        ),
                        MyCustomScrollView(
                          firstNameCard: 'Jewelry picture',
                          firstSourcePicture: 'https://i.ibb.co/F0rBHxk/9.jpg',
                          secondNameCard: 'Jewelry toys',
                          secondSourcePicture: 'https://i.ibb.co/2gdzgm7/5.jpg',
                          thirdNameCard: 'Jewelry rings',
                          thirdSourcePicture: 'https://i.ibb.co/6ZbnbxG/2.jpg',
                        ),
                        MyCustomScrollView(
                          firstNameCard: 'Wood tea cup',
                          firstSourcePicture: 'https://i.ibb.co/2gdzgm7/5.jpg',
                          secondNameCard: 'Kitchen tea cup',
                          secondSourcePicture: 'https://i.ibb.co/6ZbnbxG/2.jpg',
                          thirdNameCard: 'Tea cup picture',
                          thirdSourcePicture: 'https://i.ibb.co/F0rBHxk/9.jpg',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Featured Products'),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'See all',
                          style: TextStyle(color: Colors.black38),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const MiniOverviewProducts(),
                  const SizedBox(
                    height: 10,
                  ),
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
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
