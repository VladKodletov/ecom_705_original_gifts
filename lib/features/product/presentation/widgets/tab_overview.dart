import 'package:flutter/material.dart';

import 'package:ecom_705_original_gifts/features/product/presentation/widgets/image_card.dart';
import 'package:ecom_705_original_gifts/features/product/presentation/widgets/review_widget.dart';

class TabOverview extends StatelessWidget {
  const TabOverview(
      {super.key,
      required this.imageFirst,
      required this.imageSecond,
      required this.imageThird});

  final String imageFirst;
  final String imageSecond;
  final String imageThird;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ImageCard(imagePath: imageFirst),
            ImageCard(imagePath: imageSecond),
            ImageCard(imagePath: imageThird),
          ],
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Container(
        alignment: Alignment.topLeft,
        child: const Text('Review(102)'),
      ),
      const SizedBox(
        height: 16,
      ),
      const ReviewWidget(
          dateReview: '1 month ago',
          nameReview: 'Nikolay Ivanov',
          rateReview: '4 stars',
          textReview:
              'Two roads diverged in a yellow wood, And sorry I could not travel both And be one traveler, long I stood And looked down one as far as I could To where it bent in the undergrowth.'),
      const ReviewWidget(
          dateReview: '2 month ago',
          nameReview: 'Anton Petrov',
          rateReview: '3 stars',
          textReview:
              'Two roads diverged in a yellow wood, And sorry I could not travel both And be one traveler, long I stood And looked down one as far as I could To where it bent in the undergrowth.'),
      const SizedBox(
        height: 8,
      ),
      TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.black38),
        ),
        onPressed: () {},
        child: const Text('See all reviews'),
      )
    ]);
  }
}
