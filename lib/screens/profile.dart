import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imageProfile =
        'https://www.rabstol.net/uploads/gallery/main/138/rabstol_net_benedict_cumberbatch_07.jpg';
    const nameProfile = 'Базилик Киберскотч';
    const emailProfile = 'sherlock@gmail.com';
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Profile',
        ),
        backgroundColor: Colors.white,
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
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          nameProfile,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        emailProfile,
                        style: TextStyle(
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.black38,
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              bottom: 0,
              top: 12,
            ),
            child: Text(
              'General',
              style: TextStyle(color: Colors.black38, fontSize: 12),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Edit profile',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black),
            ),
          ),
          Divider(
            color: Colors.black38,
            height: 1,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Notifications',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black),
            ),
          ),
          Divider(
            color: Colors.black38,
            height: 1,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Wishlist',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black),
            ),
          ),
          Divider(
            color: Colors.black38,
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              bottom: 0,
              top: 12,
            ),
            child: Text(
              'Legal',
              style: TextStyle(
                color: Colors.black38,
                fontSize: 12,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Terms of Use',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black),
            ),
          ),
          Divider(
            color: Colors.black38,
            height: 1,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Privacy Policy',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black),
            ),
          ),
          Divider(
            color: Colors.black38,
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              bottom: 0,
              top: 12,
            ),
            child: Text(
              'Personal',
              style: TextStyle(
                color: Colors.black38,
                fontSize: 12,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Report a bug',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black),
            ),
          ),
          Divider(
            color: Colors.black38,
            height: 1,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Logout',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black),
            ),
          ),
          Divider(
            color: Colors.black38,
            height: 1,
          ),
        ],
      ),
    );
  }
}
