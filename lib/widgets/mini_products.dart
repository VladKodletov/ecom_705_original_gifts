import 'package:ecom_705_original_gifts/models/product.dart';

import 'package:flutter/material.dart';

class MiniOverviewProducts extends StatelessWidget {
  final List<Product> loadedProducts = [
    Product('p1', 'Wood toy "Car"', 1150, 'assets/image/6.jpg',
        'assets/image/6.jpg', 'assets/image/6.jpg'),
    Product('p2', 'Wood toy №28', 250, 'assets/image/8.jpg',
        'assets/image/8.jpg', 'assets/image/8.jpg'),
    Product('p3', 'Wood toy №9', 450, 'assets/image/7.jpg',
        'assets/image/7.jpg', 'assets/image/7.jpg'),
  ];

  MiniOverviewProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(
          right: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: loadedProducts.length,
        // ignore: avoid_types_as_parameter_names
        itemBuilder: (context, int) {
          return Material(
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {}, //routeProduct,
              child: Container(
                padding: const EdgeInsets.all(6),
                width: MediaQuery.of(context).size.width * 0.42,
                height: MediaQuery.of(context).size.height * 0.20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        loadedProducts[int].firstImageUrl,
                        width: MediaQuery.of(context).size.width * 0.28,
                        height: MediaQuery.of(context).size.height * 0.12,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      loadedProducts[int].title,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'RUB ${loadedProducts[int].price}',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
