import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:ecom_705_original_gifts/core/data/models/product_model.dart';
import 'package:ecom_705_original_gifts/features/product/presentation/product_screen.dart';

class MiniProducts extends StatefulWidget {
  const MiniProducts({super.key});

  @override
  State<MiniProducts> createState() => _MiniProductsState();
}

class _MiniProductsState extends State<MiniProducts> {
  final loadedProducts = FirebaseFirestore.instance
      .collection('products')
      .withConverter(
        fromFirestore: (snapshot, _) => ProductModel.fromJson(snapshot.data()!),
        toFirestore: (user, _) => user.toJson(),
      );

  @override
  Widget build(BuildContext context) => StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("products").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          final userSnapshot = snapshot.data?.docs;

          if (userSnapshot!.isEmpty) {
            return const Text("Don't have data");
          }
          return SizedBox(
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
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductScreen(
                                  idProductScreen: userSnapshot[int]['id'],
                                  priceProductScreen:
                                      (userSnapshot[int]['price']).toDouble(),
                                  titleProductScreen: userSnapshot[int]
                                      ['title'],
                                  amountProductScreen:
                                      (userSnapshot[int]['amount']).toDouble(),
                                  firstImageUrlProductScreen: userSnapshot[int]
                                      ['firstImageUrl'],
                                  secondImageUrlProductScreen: userSnapshot[int]
                                      ['secondImageUrl'],
                                  thirdImageUrlProductScreen: userSnapshot[int]
                                      ['thirdImageUrl'],
                                  descriptionProductScreen: userSnapshot[int]
                                      ['description'],
                                  isFavoriteProductScreen: userSnapshot[int]
                                      ['isFavorite'],
                                )));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        width: MediaQuery.of(context).size.width * 0.42,
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
              },
            ),
          );
        },
      );
}
