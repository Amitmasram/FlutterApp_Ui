class Movie {
  final String title;
  final String image;
  final int index;

  Movie({
    required this.title,
    required this.index,
    required this.image,
  });
}

List<Map<String, dynamic>> rawData = [
  {
    'title': 'CoCo',
    'image':
        'https://m.media-amazon.com/images/M/MV5BMTcyOTc2OTA1Ml5BMl5BanBnXkFtZTcwOTI1MjkzOQ@@._V1_QL75_UX380_CR0,0,380,562_.jpg',
    'index': 1,
  },
  {
    'title': 'Mad Max',
    'image':
        'http://www.impawards.com/intl/australia/2015/posters/mad_max_fury_road.jpg',
    'index': 2,
  },
  {
    'title': 'LUCA',
    'image': 'http://www.impawards.com/2021/posters/luca_ver2.jpg',
    'index': 3,
  },
  {
    'title': 'Ratatouille ',
    'image': 'http://www.impawards.com/2007/posters/ratatouille.jpg',
    'index': 4,
  },
];
