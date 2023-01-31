import 'package:flutter/material.dart';

class UnderCategoryWidget extends StatelessWidget {
  final String nameUnderCategory;

  const UnderCategoryWidget({super.key, required this.nameUnderCategory});

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
