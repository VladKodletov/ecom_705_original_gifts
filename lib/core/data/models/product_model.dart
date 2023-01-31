class ProductModel {
  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.amount,
      required this.firstImageUrl,
      this.secondImageUrl = '',
      this.thirdImageUrl = '',
      this.description = '',
      this.isFavorite = false});

  ProductModel.fromJson(Map<String, Object?> json)
      : this(
          id: json['id']! as String,
          title: json['title']! as String,
          price: json['price']! as double,
          amount: json['amount']! as double,
          firstImageUrl: json['firstImageUrl']! as String,
          secondImageUrl: json['secondImageUrl']! as String,
          thirdImageUrl: json['thirdImageUrl']! as String,
          description: json['description']! as String,
          isFavorite: json['isFavorite']! as bool,
        );

  final double amount;
  final String description;
  final String firstImageUrl;
  final String id;
  final bool isFavorite;
  final double price;
  final String secondImageUrl;
  final String thirdImageUrl;
  final String title;

  Map<String, Object?> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'amount': amount,
        'firstImageUrl': firstImageUrl,
        'secondImageUrl': secondImageUrl,
        'thirdImageUrl': thirdImageUrl,
        'description': description,
        'isFavorite': isFavorite,
      };
}
