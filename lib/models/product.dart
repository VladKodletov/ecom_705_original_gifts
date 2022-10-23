class Product {
  final String id;
  final String title;
  final double price;
  final String firstImageUrl;
  final String secondImageUrl;
  final String thirdImageUrl;
  final String description;
  final bool isFavorite;
  ///добавить в свойства продукта количество товара
  //!!! добавить поля для отзывов(из рейтинга, текста, и электронной почты со звездочками
  //)!, подумать как организовать! либо отдельный класс/модель для отзывов, который
  //который будет связываться с продуктами по их id?

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.firstImageUrl,
      this.secondImageUrl = '',
      this.thirdImageUrl = '',
      this.description = '',
      this.isFavorite = false});
}
