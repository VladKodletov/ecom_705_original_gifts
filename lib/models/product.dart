class Product {
  final String id;
  final String title;
  final double price;
  final String description;
  final String firstImageUrl;
  final String secondImageUrl;
  final String thirdImageUrl;
  bool isFavorite;

  Product(this.id, this.title, this.price, this.description, this.firstImageUrl,
      this.secondImageUrl, this.thirdImageUrl,
      {this.isFavorite = false});
}


