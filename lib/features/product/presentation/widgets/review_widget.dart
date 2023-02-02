import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class ReviewWidget extends StatefulWidget {
  const ReviewWidget(
      {super.key,
      required this.nameReview,
      required this.dateReview,
      required this.rateReview,
      required this.textReview});

  final String dateReview;
  final String nameReview;
  final String rateReview;
  final String textReview;

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  double value = 3.5;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage(
            'https://www.rabstol.net/uploads/gallery/main/138/rabstol_net_benedict_cumberbatch_07.jpg',
          ),
          radius: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(right: 6),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(right: 16),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.nameReview),
                    Text(
                      widget.dateReview,
                      style: const TextStyle(color: Colors.black38),
                    ),
                  ],
                ),
                RatingStars(
                  value: value,
                  starColor: const Color(0xFFFFC120),
                  onValueChanged: (v) {
                    //
                    setState(() {
                      value = v;
                    });
                  },
                  starBuilder: (index, color) => Icon(
                    Icons.star_outlined,
                    color: color,
                  ),
                  starCount: 5,
                  starSize: 20,
                  valueLabelVisibility: false,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(widget.textReview),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
