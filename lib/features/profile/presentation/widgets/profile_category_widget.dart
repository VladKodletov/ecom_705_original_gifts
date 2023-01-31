import 'package:flutter/material.dart';

class ProfileCategoryWidget extends StatelessWidget {
  final String categoryName;

  const ProfileCategoryWidget({super.key, required this.categoryName});

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
