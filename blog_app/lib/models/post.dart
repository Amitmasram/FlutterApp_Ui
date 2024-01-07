class Post {
  final int id;
  final String caption;
  final String title;
  final String likes;
  final String time;
  final bool isBookmarked;
  final String imageFileName;
  final String description;

  const Post({
    required this.id,
    required this.caption,
    required this.title,
    required this.likes,
    required this.time,
    required this.isBookmarked,
    required this.imageFileName,
    required this.description,
  });
}

const List<Post> posts = [
  Post(
    id: 1,
    title: 'New Mac M3 in Market',
    caption: 'TOP GEAR',
    isBookmarked: false,
    likes: '3.1k',
    time: '1hr ago',
    description: 'M3 chip is a considerable upgrade from the ‌M2‌',
    imageFileName:
        'https://i.pinimg.com/564x/08/f1/c2/08f1c25de188cedec0311e1af17b25de.jpg',
  ),
  Post(
    id: 0,
    title: "What's Elone Saying these Days",
    caption: 'THE VERGE',
    isBookmarked: false,
    likes: '1.2k',
    time: '2hr ago',
    description: 'Start wide, expand further, and never look back',
    imageFileName:
        'https://i.pinimg.com/474x/e6/87/0e/e6870e91dd16984a576be63b2a9c31fa.jpg',
  ),
  Post(
    id: 2,
    title: 'Step design sprint for UX beginner',
    caption: 'Ux Design',
    isBookmarked: true,
    likes: '2k',
    time: '41hr ago',
    description: 'Strategy, scope, structure, skeleton and surface',
    imageFileName:
        'https://i.pinimg.com/474x/d6/fe/31/d6fe314f31971d11183854c1158d6e9a.jpg',
  ),
];
