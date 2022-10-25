import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_705_original_gifts/models/product.dart';

import 'package:flutter/material.dart';

import '../screens/product_screen.dart';

class MiniOverviewProducts extends StatefulWidget {
  const MiniOverviewProducts({super.key});

  @override
  State<MiniOverviewProducts> createState() => _MiniOverviewProductsState();
}

class _MiniOverviewProductsState extends State<MiniOverviewProducts> {
  final loadedProducts =
      FirebaseFirestore.instance.collection('products').withConverter(
            fromFirestore: (snapshot, _) => Product.fromJson(snapshot.data()!),
            toFirestore: (user, _) => user.toJson(),
          );

  // @override
  // void setState(VoidCallback fn) {
  //   super.setState(fn);
  // }

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
                        //пример перехода по навигатору на конкретную страницу с пробросом значений для полей
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
                        //fix dead code bottom - DRY principle
                        // height: MediaQuery.of(context).size.height * 0.20,
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
