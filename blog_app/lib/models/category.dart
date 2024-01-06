class Category {
  final int id;
  final String title;
  final String imageFileName;

  const Category({
    required this.id,
    required this.title,
    required this.imageFileName,
  });
}

const List<Category> categories = [
  Category(
    id: 1,
    title: 'Technology',
    imageFileName: 'assets/img/posts/large/large_post_1.jpg',
  ),
  Category(
    id: 2,
    title: 'Cinema',
    imageFileName: 'assets/img/posts/large/large_post_2.jpg',
  ),
  Category(
    id: 3,
    title: 'Transportation',
    imageFileName: 'assets/img/posts/large/large_post_3.jpg',
  ),
  Category(
    id: 4,
    title: 'Adventure',
    imageFileName: 'assets/img/posts/large/large_post_4.jpg',
  ),
  Category(
    id: 5,
    title: 'Artificial Intelligence',
    imageFileName: 'assets/img/posts/large/large_post_5.jpg',
  ),
  Category(
    id: 6,
    title: 'Economy',
    imageFileName: 'assets/img/posts/large/large_post_6.jpg',
  ),
];
