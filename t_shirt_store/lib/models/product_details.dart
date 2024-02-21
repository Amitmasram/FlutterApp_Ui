class ProductDetails {
  final String name, price, imagePath;
  bool? isFav;

  ProductDetails({
    required this.name,
    required this.price,
    required this.imagePath,
    this.isFav = false,
  });
}
