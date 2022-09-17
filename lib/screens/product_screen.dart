import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  // const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
              const Text('price'),
              const Text('name product'),
              const Text('3 select button'),
              SingleChildScrollView(child: Row()),
              const Text('Review'),
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
