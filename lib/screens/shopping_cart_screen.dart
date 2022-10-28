import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  ShoppingCart({Key? key}) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
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
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users_cart')
                .doc(FirebaseAuth.instance.currentUser!.email)
                .collection('productsCart')
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Ошибочка вышла'),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data?.size ?? 0,
                itemBuilder: (_, index) {
                  DocumentSnapshot snapshotDoc = snapshot.data!.docs[index];
                  double priceToCart = snapshotDoc['price'];
                  return ListTile(
                    leading: Image.network(snapshotDoc['image']),
                    title: Text(snapshotDoc['name']),
                    subtitle: Text('$priceToCart рублей'),
                    trailing: IconButton(onPressed: (() {
                      
                    }), icon: Icon(Icons.remove_shopping_cart_outlined),
                  );
                },
              );
            }));
    const Center(
      child: Text(
        'Корзина',
        style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
      ),

      // FutureBuilder(builder: (context, snapshot) {
      //    if (snapshot.hasError) {
      //         return const Center(
      //           child: Text('Ошибочка вышла'),
      //         );
      //       }
      //       return ListView.builder(
      //         itemCount: int.tryParse(FirebaseFirestore.instance.collection('users_cart').doc(FirebaseAuth.instance.currentUser!.email).collection('productsCart').snapshots().length.toString()),
      //         itemBuilder: (_, index) {
      //           DocumentSnapshot snapshotDoc = snapshot.data!.docs[index];
      //           double priceToCart = snapshotDoc['price'];
      //           return ListTile(
      //             leading: Image.network(snapshotDoc['image']),
      //             title: Text(snapshotDoc['name']),
      //             subtitle: Text('$priceToCart'),
      //           );
      //         },
      //       );
      // },),
    );
  }
}
