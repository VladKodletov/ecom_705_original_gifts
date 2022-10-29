import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'shopping_cart_screen.dart';

class ProfileScreen extends StatelessWidget {
  final email = FirebaseAuth.instance.currentUser!.email.toString();
  final String imageProfile =
      'https://www.rabstol.net/uploads/gallery/main/138/rabstol_net_benedict_cumberbatch_07.jpg';
  final String nameProfile = 'Базилик Киберскотч';
  // final String emailProfile = email;

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () => FirebaseAuth.instance.signOut(),
        ),
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
                        MaterialPageRoute(builder: (context) => const ShoppingCart()),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      imageProfile,
                    ),
                    radius: 40,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          nameProfile,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        email,
                        style: const TextStyle(
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          _MyProfileWidget(),
          const _ProfileCategoryWidget(
            categoryName: 'General',
          ),
          _ProfileWidgetButton(
            nameButton: 'Edit profile',
            onPressed: () {},
          ),
          _MyProfileWidget(),
          _ProfileWidgetButton(
            nameButton: 'Notifications',
            onPressed: () {},
          ),
          _MyProfileWidget(),
          _ProfileWidgetButton(
            nameButton: 'Wishlist',
            onPressed: () {},
          ),
          _MyProfileWidget(),
          const _ProfileCategoryWidget(
            categoryName: 'Legal',
          ),
          _ProfileWidgetButton(
            nameButton: 'Terms of Use',
            onPressed: () {},
          ),
          _MyProfileWidget(),
          _ProfileWidgetButton(
            nameButton: 'Privacy Policy',
            onPressed: () {},
          ),
          _MyProfileWidget(),
          const _ProfileCategoryWidget(
            categoryName: 'Personal',
          ),
          _ProfileWidgetButton(
            nameButton: 'Report a bug',
            onPressed: () {},
          ),
          _MyProfileWidget(),
          _ProfileWidgetButton(
            nameButton: 'Logout',
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
          _MyProfileWidget(),
        ],
      ),
    );
  }
}

class _ProfileCategoryWidget extends StatelessWidget {
  final String categoryName;

  const _ProfileCategoryWidget({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        bottom: 0,
        top: 12,
      ),
      child: Text(
        categoryName,
        style: const TextStyle(
          color: Colors.black38,
          fontSize: 12,
        ),
      ),
    );
  }
}

class _ProfileWidgetButton extends StatelessWidget {
  final String nameButton;
  final Function() onPressed;

  const _ProfileWidgetButton(
      {required this.nameButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        nameButton,
        textAlign: TextAlign.left,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}

class _MyProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.black38,
      height: 1,
    );
  }
}
