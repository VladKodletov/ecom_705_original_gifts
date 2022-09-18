import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final double priceProductScreen;

  const ProductScreen({super.key, required this.priceProductScreen});

  // const ProductScreen({Key? key}) : super(key: key);

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
          child: Padding(
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
                        'RUB $priceProductScreen',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0ACF83),
                        ),
                      ),
                      const Text(
                        'name product',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text('3 select button'),
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
                  height: 16,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: const Text('Review(102)'),
                ),
                const SizedBox(
                  height: 16,
                ),
                const ReviewWidget(),
                Row(
                  children: const [
                    Text('Another Product'),
                    Text('See All'),
                    SingleChildScrollView(),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Add to cart'),
                ),
              ],
            ),
          ),
        ));
  }
}

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.man),
        Column(
          children: const [Text('name'), Text('rate review')],
        ),
        const Text('date review'),
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
