import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_705_original_gifts/features/profile/presentation/widgets/profile_category_widget.dart';
import 'package:ecom_705_original_gifts/features/profile/presentation/widgets/profile_divider_widget.dart';
import 'package:ecom_705_original_gifts/features/profile/presentation/widgets/profile_widget_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final email = FirebaseAuth.instance.currentUser!.email.toString();
  final String imageProfile =
      'https://www.rabstol.net/uploads/gallery/main/138/rabstol_net_benedict_cumberbatch_07.jpg';
  final String nameProfile = 'Anton Petrov';

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
                String shopCartCount = (snapshot.data?.size ?? 0).toString();
                return Badge(
                  showBadge: shopCartCount == '0' ? false : true,
                  position: BadgePosition.bottomEnd(bottom: 30, end: 0),
                  badgeContent: Text((snapshot.data?.size ?? 0).toString()),
                  child: IconButton(
                    icon: const Icon(Icons.shopping_cart_outlined),
                    onPressed: () {},
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
                    radius: 40,
                    backgroundImage: NetworkImage(
                      imageProfile,
                    ),
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
          const ProfileDividerWidget(),
          const ProfileCategoryWidget(
            categoryName: 'General',
          ),
          ProfileWidgetButton(
            nameButton: 'Edit profile',
            onPressed: () {},
          ),
          const ProfileDividerWidget(),
          ProfileWidgetButton(
            nameButton: 'Notifications',
            onPressed: () {},
          ),
          const ProfileDividerWidget(),
          ProfileWidgetButton(
            nameButton: 'Wishlist',
            onPressed: () {},
          ),
          const ProfileDividerWidget(),
          const ProfileCategoryWidget(
            categoryName: 'Legal',
          ),
          ProfileWidgetButton(
            nameButton: 'Terms of Use',
            onPressed: () {},
          ),
          const ProfileDividerWidget(),
          ProfileWidgetButton(
            nameButton: 'Privacy Policy',
            onPressed: () {},
          ),
          const ProfileDividerWidget(),
          const ProfileCategoryWidget(
            categoryName: 'Personal',
          ),
          ProfileWidgetButton(
            nameButton: 'Report a bug',
            onPressed: () {},
          ),
          const ProfileDividerWidget(),
          ProfileWidgetButton(
            nameButton: 'Logout',
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
          const ProfileDividerWidget(),
        ],
      ),
    );
  }
}




