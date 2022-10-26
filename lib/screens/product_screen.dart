import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../widgets/mini_products.dart';

class ProductScreen extends StatefulWidget {
  final String idProductScreen;
  final double priceProductScreen;
  final String titleProductScreen;
  final double amountProductScreen;
  final String firstImageUrlProductScreen;
  final String secondImageUrlProductScreen;
  final String thirdImageUrlProductScreen;
  final String descriptionProductScreen;
  final bool isFavoriteProductScreen;

  const ProductScreen(
      {super.key,
      required this.idProductScreen,
      required this.priceProductScreen,
      required this.titleProductScreen,
      required this.amountProductScreen,
      required this.firstImageUrlProductScreen,
      this.secondImageUrlProductScreen = '',
      this.thirdImageUrlProductScreen = '',
      this.descriptionProductScreen = '',
      this.isFavoriteProductScreen = false});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 2, vsync: this);
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
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
                            Text(
                              widget.titleProductScreen,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      DefaultTabController(
                        length: 2,
                        child: TabBar(
                          controller: _tabController,
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            TabOverview(
                              imageFirst: widget.firstImageUrlProductScreen,
                              imageSecond: widget.secondImageUrlProductScreen,
                              imageThird: widget.thirdImageUrlProductScreen,
                            ),

                            SizedBox(
                              child: Text(
                                widget.descriptionProductScreen,
                                textAlign: TextAlign.start,
                                style: const TextStyle(fontSize: 32),
                              ),
                            ),
                            // TabOverview(
                            //   imageFirst: widget.firstImageUrlProductScreen,
                            //   imageSecond: widget.secondImageUrlProductScreen,
                            //   imageThird: widget.thirdImageUrlProductScreen,
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 40),
                  color: Colors.black12,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 8, right: 4),
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
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: MiniOverviewProducts(),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromHeight(35),
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
        ],
      ),
    );
  }
}

class ReviewWidget extends StatefulWidget {
  final String nameReview;

  final String dateReview;

  final String rateReview;

  final String textReview;

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

class TabOverview extends StatelessWidget {
  final String imageFirst;
  final String imageSecond;
  final String imageThird;

  const TabOverview(
      {super.key,
      required this.imageFirst,
      required this.imageSecond,
      required this.imageThird});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ImageCard(
                imagePath: imageFirst), //widget.firstImageUrlProductScreen
            ImageCard(
                imagePath: imageSecond), //widget.secondImageUrlProductScreen
            ImageCard(
                imagePath: imageThird), // widget.thirdImageUrlProductScreen
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
          foregroundColor: MaterialStateProperty.all(Colors.black38),
        ),
        onPressed: () {},
        child: const Text('See all reviews'),
      )
    ]);
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
        child: Image.network(
          imagePath,
          width: MediaQuery.of(context).size.width * 0.75,
          height: MediaQuery.of(context).size.height * 0.35,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
