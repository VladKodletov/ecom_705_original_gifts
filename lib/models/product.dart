
class Product {
  final String id;
  final String title;
  final double price;
  final double amount;
  final String firstImageUrl;
  final String secondImageUrl;
  final String thirdImageUrl;
  final String description;
  final bool isFavorite;

  //!!! добавить поля для отзывов(из рейтинга, текста, и электронной почты со звездочками
  //)!, подумать как организовать! либо отдельный класс/модель для отзывов, который
  //который будет связываться с продуктами по их id?

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.amount,
      required this.firstImageUrl,
      this.secondImageUrl = '',
      this.thirdImageUrl = '',
      this.description = '',
      this.isFavorite = false});

  Product.fromJson(Map<String, Object?> json)
      : this(
          id: json['id']! as String,
          title: json['title']! as String,
          price: json['price']! as double,
          amount: json['amount']! as double,
          firstImageUrl: json['firstImageUrl']! as String,
        );
  Map<String, Object?> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'amount': amount,
        'firstImageUrl': firstImageUrl,
      };
}
