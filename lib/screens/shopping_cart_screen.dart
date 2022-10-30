import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users_cart')
                    .doc(FirebaseAuth.instance.currentUser!.email)
                    .collection('productsCart')
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  String shopCartCount = (snapshot.data?.size ?? 0).toString();
                  return Badge(
                    showBadge: shopCartCount == '0' ? false : true,
                    position: BadgePosition.bottomEnd(bottom: 30, end: 0),
                    badgeContent: Text((snapshot.data?.size ?? 0).toString()),
                    child: IconButton(
                      icon: const Icon(Icons.shopping_cart_outlined),
                      onPressed: () {},
                    ),
                  );
                })
          ],
          // TODO нужна ли тут кнопка очистки корзины?
          // actions: [
          //   TextButton(
          //     style: ButtonStyle(
          //         foregroundColor: MaterialStateProperty.all(Colors.white)),
          //     onPressed: () => FirebaseFirestore.instance
          //         .collection('users_cart')
          //         .doc(FirebaseAuth.instance.currentUser!.email)
          //         .delete(),
          //     child: Text('Clear shopping cart'),
          //   )
          // ],
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
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users_cart')
                .doc(FirebaseAuth.instance.currentUser!.email)
                .collection('productsCart')
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              // Stream<DocumentSnapshot<Map<String, dynamic>>> snapShotGlobal =
              //     FirebaseFirestore.instance
              //         .collection('users_cart')
              //         .doc(FirebaseAuth.instance.currentUser!.email)
              //         .collection('productsCart')
              //         .doc()
              //         .snapshots();

              if (snapshot.hasError) {
                return const Center(
                  child: Text('Ошибочка вышла'),
                );
              }
              return Stack(
                children: [
                  ListView.builder(
                    itemCount: snapshot.data?.size ?? 0,
                    itemBuilder: (_, index) {
                      DocumentSnapshot snapshotDoc = snapshot.data!.docs[index];
                      double priceToCart = snapshotDoc['price'];
                      return ListTile(
                          leading: CircleAvatar(
                              radius: 20,
                              child: Image.network(snapshotDoc['image'])),
                          title: Text(snapshotDoc['name']),
                          subtitle: Text('$priceToCart рублей'),
                          trailing: IconButton(
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection('users_cart')
                                  .doc(FirebaseAuth.instance.currentUser!.email)
                                  .collection('productsCart')
                                  .doc(snapshotDoc.id)
                                  .delete();
                            },
                            icon:
                                const Icon(Icons.remove_shopping_cart_outlined),
                          ));
                    },
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     fixedSize: const Size.fromHeight(35),
                      //     backgroundColor:
                      //         const Color(0xFF0ACF83).withOpacity(0.5),
                      //   ),
                      //   onPressed: () {},
                      //   child: const Text(
                      //     'Continue shopping',
                      //     style: TextStyle(fontSize: 18),
                      //   ),
                      // ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size.fromHeight(35),
                          backgroundColor: const Color(0xFF0ACF83),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Proceed to checkout',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }));
  }
}
