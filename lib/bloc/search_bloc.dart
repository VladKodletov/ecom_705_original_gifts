import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_705_original_gifts/bloc/bloc.dart';

import '../models/product.dart';

class SearchProductsBloc implements Bloc {
  final _productsFirebase = FirebaseFirestore.instance.collection('products');
  final _searchController = StreamController<String?>();
  Sink<String?> get searchInput => _searchController.sink;
  late Stream<List<Product>?> productStream;

  SearchProductsBloc() {
    productStream = _searchController.stream.asyncMap(
      (event) {},
    );
  }

  @override
  void dispose() {
    _searchController.close();
  }
}
