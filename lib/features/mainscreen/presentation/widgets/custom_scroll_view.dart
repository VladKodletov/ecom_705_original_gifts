import 'package:flutter/material.dart';

import 'under_category_card.dart';

class MyCustomScrollView extends StatelessWidget {
  final String firstNameCard;
  final String secondNameCard;
  final String thirdNameCard;
  final String firstSourcePicture;
  final String secondSourcePicture;
  final String thirdSourcePicture;

  const MyCustomScrollView(
      {super.key,
      required this.firstNameCard,
      required this.secondNameCard,
      required this.thirdNameCard,
      required this.firstSourcePicture,
      required this.secondSourcePicture,
      required this.thirdSourcePicture});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          UnderCategoryCard(
            nameUnderCategory: firstNameCard,
            picturesUnderCategory: firstSourcePicture,
          ),
          const SizedBox(
            width: 10,
          ),
          UnderCategoryCard(
            nameUnderCategory: secondNameCard,
            picturesUnderCategory: secondSourcePicture,
          ),
          const SizedBox(
            width: 10,
          ),
          UnderCategoryCard(
            nameUnderCategory: thirdNameCard,
            picturesUnderCategory: thirdSourcePicture,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
