import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'shopping_cart_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);

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
                return Badge(
                  position: BadgePosition.bottomEnd(bottom: 30, end: 0),
                  badgeContent: Text((snapshot.data?.size ?? 0).toString()),
                  child: IconButton(
                    icon: const Icon(Icons.shopping_cart_outlined),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ShoppingCart()),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
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
              const ExpansionTile(
                title: Text('Personal gift'),
                children: [
                  _UnderCategory(
                    nameUnderCategory: 'Personal picture',
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: ExpansionTile(
                      title: Text('Personal jewelry'),
                      children: [
                        _UnderCategory(
                          nameUnderCategory: 'Personal ring',
                        ),
                        _UnderCategory(
                          nameUnderCategory: 'Personal earrings',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const ExpansionTile(
                title: Text('Wood gift'),
                children: [
                  _UnderCategory(
                    nameUnderCategory: 'Wood toys',
                  ),
                  _UnderCategory(
                    nameUnderCategory: 'Wood kitchen board',
                  ),
                ],
              ),
              const ExpansionTile(
                title: Text('Tea cup'),
                children: [],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _UnderCategory extends StatelessWidget {
  final String nameUnderCategory;

  const _UnderCategory({required this.nameUnderCategory});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: ListTile(
        title: Text(nameUnderCategory),
        onTap: () {},
      ),
    );
  }
}
