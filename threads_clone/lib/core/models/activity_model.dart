class ActivityModel {
  final String username;
  final String profile;
  final String type;
  final String timeAgo;
  bool isFollowing;

  ActivityModel({
    required this.username,
    required this.profile,
    required this.type,
    required this.timeAgo,
    this.isFollowing = false,
  });

  static ActivityModel fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      username: json["username"],
      profile: json["profile"],
      type: json["type"],
      timeAgo: json["timeAgo"],
      isFollowing: json["isFollowing"],
    );
  }
}
