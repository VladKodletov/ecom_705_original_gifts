class Product {
  final String id;
  final String title;
  final double price;
  final String firstImageUrl;
  final String secondImageUrl;
  final String thirdImageUrl;
  String description;
  bool isFavorite;

  Product(this.id, this.title, this.price, this.firstImageUrl,
      this.secondImageUrl, this.thirdImageUrl,
      {this.description = '', this.isFavorite = false});
}
