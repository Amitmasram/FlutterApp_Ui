class Artist {
  final String artName;
  final String imageUrl;
  final int stars;
  final List<String> genres;
  final double rating;

  Artist({
    required this.stars,
    required this.imageUrl,
    required this.artName,
    required this.genres,
    required this.rating,
  });
}
