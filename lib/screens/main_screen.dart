// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../widgets/custom_scroll_view.dart';
import '../widgets/mini_products.dart';

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
          Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DefaultTabController(
                    length: 4,
                    initialIndex: 0,
                    child: TabBar(
                      controller: _tabController,
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
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.30,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
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
                    height: 18,
                  ),
                  MiniOverviewProducts(),
                  SizedBox(
                    height: 20,
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
