import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_705_original_gifts/models/product.dart';

import 'package:flutter/material.dart';

class MiniOverviewProducts extends StatelessWidget {
  final loadedProducts =
      FirebaseFirestore.instance.collection('products').withConverter(
            fromFirestore: (snapshot, _) => Product.fromJson(snapshot.data()!),
            toFirestore: (user, _) => user.toJson(),
          );

  //
  //final List<Product> loadedProducts = [
  //   Product(
  //     amount: 3,
  //       id: 'p1',
  //       title: 'Wood toy "Car"',
  //       price: 1150,
  //       firstImageUrl: 'assets/image/6.jpg',
  //       secondImageUrl: 'assets/image/6.jpg',
  //       thirdImageUrl: 'assets/image/6.jpg'),
  //   Product(
  //     amount: 2,
  //       id: 'p2',
  //       title: 'Wood toy №28',
  //       price: 250,
  //       firstImageUrl: 'assets/image/8.jpg',
  //       secondImageUrl: 'assets/image/8.jpg',
  //       thirdImageUrl: 'assets/image/8.jpg'),
  //   Product(
  //     amount: 1,
  //       id: 'p3',
  //       title: 'Wood toy №9',
  //       price: 450,
  //       firstImageUrl: 'assets/image/7.jpg',
  //       secondImageUrl: 'assets/image/7.jpg',
  //       thirdImageUrl: 'assets/image/7.jpg'),
  // ];

  MiniOverviewProducts({super.key});

  @override
  Widget build(BuildContext context) => StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("products").snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        final userSnapshot = snapshot.data?.docs;
        if (userSnapshot!.isEmpty) {
          return const Text("Данные не загружены");
        }
        return Container(
          height: MediaQuery.of(context).size.height * 0.20,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: userSnapshot.length,
              // ignore: avoid_types_as_parameter_names
              itemBuilder: (context, int) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Material(
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
                              child: Image.network(
                                userSnapshot[int]['firstImageUrl'],
                                width: MediaQuery.of(context).size.width * 0.28,
                                height:
                                    MediaQuery.of(context).size.height * 0.12,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              userSnapshot[int]['title'],
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'RUB ${userSnapshot[int]['price']}',
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        );
      });
}
