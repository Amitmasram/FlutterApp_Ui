class BMShoppingModel {
  String name;
  String cost;
  String rate;
  String mrp;
  String views;
  String image;
  int items;
  bool isAdded;

  BMShoppingModel({
    required this.name,
    required this.cost,
    required this.image,
    required this.isAdded,
    required this.items,
    required this.mrp,
    required this.rate,
    required this.views,
  });
}
