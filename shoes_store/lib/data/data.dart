class Data {
  final int cardColor;
  final String imgUrl;
  final String title;
  final String previousPrice;
  final String price;

  Data(
      {required this.cardColor,
      required this.imgUrl,
      required this.title,
      required this.previousPrice,
      required this.price});

  static List<Data> datalist = [
    Data(
        cardColor: 0xFFfaecfb,
        imgUrl: 'assets/shoes_01.png',
        title: 'Hybrid Rocket WNS',
        previousPrice: '\$999.00',
        price: "\$749"),
    Data(
        cardColor: 0xFFf8e1da,
        imgUrl: 'assets/shoes_02.png',
        title: 'Hybrid Runner AR',
        previousPrice: '\$699',
        price: "\$599")
  ];
}
