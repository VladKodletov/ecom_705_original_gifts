import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import 'main_screen.dart';

class ProductScreen extends StatefulWidget {
  final double priceProductScreen;

  const ProductScreen({super.key, required this.priceProductScreen});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          )
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 25,
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'RUB ${widget.priceProductScreen}',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0ACF83),
                          ),
                        ),
                        const Text(
                          'Wood toy №28',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  DefaultTabController(
                    length: 3,
                    initialIndex: 0,
                    child: TabBar(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      indicatorColor: const Color(0xFF0ACF83),
                      tabs: const [
                        Tab(
                          text: "Overview",
                        ),
                        Tab(
                          text: "Features",
                        ),
                        Tab(
                          text: "Specification",
                        ),
                      ],
                      labelColor: Colors.black,
                      indicator: MaterialIndicator(
                        height: 5,
                        topLeftRadius: 8,
                        bottomLeftRadius: 8,
                        bottomRightRadius: 8,
                        topRightRadius: 8,
                        horizontalPadding: 50,
                        color: const Color(0xFF0ACF83),
                        tabPosition: TabPosition.bottom,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                        ImageCard(imagePath: 'assets/image/6.jpg'),
                        ImageCard(imagePath: 'assets/image/6.jpg'),
                        ImageCard(imagePath: 'assets/image/6.jpg'),
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
                      nameReview: 'Базилик Киберскотч',
                      rateReview: '4 stars',
                      textReview:
                          'Two roads diverged in a yellow wood, And sorry I could not travel both And be one traveler, long I stood And looked down one as far as I could To where it bent in the undergrowth.'),
                  const ReviewWidget(
                      dateReview: '2 month ago',
                      nameReview: 'Бургеркинг Гендерсвитч',
                      rateReview: '3 stars',
                      textReview:
                          'blablaablablablablablaablablablablablaablablablablablaablablablablablaablablablablablaablablablablablaablablablablablaablablablablablaablablablablablaablabl'),
                  const SizedBox(
                    height: 8,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all(Colors.black38),
                    ),
                    onPressed: () {},
                    child: const Text('See all reviews'),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.black12,
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 20, right: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Another Product'),
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black38),
                          ),
                          onPressed: () {},
                          child: const Text('See all'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          ProductsCard(
                            nameProduct: 'Wood toy №28',
                            imageProduct: 'assets/image/8.jpg',
                            priceProduct: '250',
                            routeProduct: () {},
                          ),
                          ProductsCard(
                            nameProduct: 'Wood toy "Car"',
                            imageProduct: 'assets/image/6.jpg',
                            priceProduct: '1150',
                            routeProduct: () {},
                          ),
                          ProductsCard(
                            nameProduct: 'Wood toy №28',
                            imageProduct: 'assets/image/8.jpg',
                            priceProduct: '250',
                            routeProduct: () {},
                          ),
                          ProductsCard(
                            nameProduct: 'Wood toy "Car"',
                            imageProduct: 'assets/image/6.jpg',
                            priceProduct: '1150',
                            routeProduct: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            // fixedSize: const Size.fromHeight(55),
                            backgroundColor: const Color(0xFF0ACF83),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Add to cart',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReviewWidget extends StatefulWidget {
  final String nameReview;

  ///'Базилик Киберскотч'
  final String dateReview;

  ///'1 month ago'
  final String rateReview;

  ///'4 stars'
  final String textReview;

  ///

  const ReviewWidget(
      {super.key,
      required this.nameReview,
      required this.dateReview,
      required this.rateReview,
      required this.textReview});

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
            // alignment: Alignment.topLeft,
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
                  // starOffColor: Colors.white,
                  //  valueLabelColor: Colors.white,
                  // starOffColor: Colors.white,
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

class ImageCard extends StatelessWidget {
  final String imagePath;

  const ImageCard({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imagePath,
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.45,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
