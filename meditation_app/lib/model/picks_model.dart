class Picks {
  String image;
  String title;
  String subTitle;
  Picks({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}

List<Picks> dummyPicks = [
  Picks(
      image: 'assets/exercise.jpg',
      title: 'Focus',
      subTitle: 'MEDITATION - 7 min'),
  Picks(
      image: 'assets/snail.jpg',
      title: 'Morning Stretching',
      subTitle: 'WORKOUT - 30 min')
];
