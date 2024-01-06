class Story {
  final int id;
  final String name;
  final String imageFileName;
  final String iconFileName;
  final bool isViewed;

  const Story({
    required this.id,
    required this.name,
    required this.imageFileName,
    required this.iconFileName,
    required this.isViewed,
  });
}

const List<Story> stories = [
  Story(
    id: 2,
    name: 'James',
    imageFileName: 'assets/img/stories/story_10.jpg',
    iconFileName: 'assets/img/icons/category_2.png',
    isViewed: false,
  ),
  Story(
    id: 3,
    name: 'Jully',
    imageFileName: 'assets/img/stories/story_1.jpg',
    iconFileName: 'assets/img/icons/category_3.png',
    isViewed: true,
  ),
  Story(
    id: 4,
    name: 'Lucas',
    imageFileName: 'assets/img/stories/story_3.jpg',
    iconFileName: 'assets/img/icons/category_4.png',
    isViewed: false,
  ),
  Story(
    id: 5,
    name: 'Tina',
    imageFileName: 'assets/img/stories/story_4.jpg',
    iconFileName: 'assets/img/icons/category_2.png',
    isViewed: false,
  ),
  Story(
    id: 6,
    name: 'Olivia',
    imageFileName: 'assets/img/stories/story_6.jpg',
    iconFileName: 'assets/img/icons/category_1.png',
    isViewed: false,
  ),
  Story(
    id: 7,
    name: 'Amelia',
    imageFileName: 'assets/img/stories/story_7.jpg',
    iconFileName: 'assets/img/icons/category_4.png',
    isViewed: false,
  ),
  Story(
    id: 8,
    name: 'Grace',
    imageFileName: 'assets/img/stories/story_2.jpg',
    iconFileName: 'assets/img/icons/category_3.png',
    isViewed: false,
  ),
];
