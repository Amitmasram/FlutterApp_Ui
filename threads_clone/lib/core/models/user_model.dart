class UserModel {
  final String name;
  final String profile;
  final String username;
  final bool isVerified;
  String? followers;
  List<FriendFollow>? friendsFollow;

  UserModel({
    required this.name,
    required this.profile,
    required this.username,
    this.isVerified = false,
    this.followers,
    this.friendsFollow,
  });

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json["name"],
        profile: json["profile"],
        username: json["username"],
        isVerified: json["isVerified"],
        followers: json["followers"],
        friendsFollow: json["friendsFollow"]);
  }
}

class FriendFollow {
  final String photo;

  FriendFollow({
    required this.photo,
  });

  static FriendFollow fromJson(Map<String, dynamic> json) {
    return FriendFollow(
      photo: json["photo"],
    );
  }
}
