import '../../gen/assets.gen.dart';
import '../models/activity_model.dart';
import '../models/feed_model.dart';
import '../models/user_model.dart';

List<FeedModel> feeds() {
  return [
    FeedModel(
      name: "zuck",
      isVerified: true,
      profile: Assets.images.profilePic.path,
      contentText:
          "Here’s to the crazy ones. The misfits. The rebels. The troublemakers. The round pegs in the square holes.",
      timeAgo: "33m",
      likes: "17.2K",
      replies: "3,339",
      isFollow: true,
      userLikes: [
        UserLikes(photo: Assets.images.avatar1.path),
        UserLikes(photo: Assets.images.avatar2.path),
      ],
    ),
    FeedModel(
      name: "agis",
      isVerified: true,
      profile: Assets.images.profileAgis.path,
      contentText:
          "Here’s this is figma's implementation of UI threads using Flutter and BLoC state management 🚀",
      timeAgo: "1h",
      likes: "6K",
      replies: "231",
      isFollow: true,
      userLikes: [
        UserLikes(photo: Assets.images.avatar4.path),
        UserLikes(photo: Assets.images.avatar5.path),
      ],
    ),
    FeedModel(
      name: "Kathryn Murphy",
      isVerified: false,
      profile: Assets.images.avatar2.path,
      contentText:
          "I love the idea of turning setbacks into opportunities for growth. It's all about the mindset! 💪",
      timeAgo: "26m",
      likes: "54",
      replies: "2",
      contentPhoto: Assets.images.postImage.path,
      userLikes: [
        UserLikes(photo: Assets.images.avatar3.path),
        UserLikes(photo: Assets.images.avatar1.path),
      ],
    ),
    FeedModel(
      name: "Wade Warren",
      isVerified: false,
      profile: Assets.images.avatar6.path,
      contentText:
          "Let's talk about the incredible power of perseverance and how it can change your life. ",
      timeAgo: "2h",
      likes: "135",
      replies: "12",
      userLikes: [
        UserLikes(photo: Assets.images.avatar1.path),
        UserLikes(photo: Assets.images.avatar3.path),
      ],
    ),
    FeedModel(
      name: "Jacob Jones",
      isVerified: true,
      profile: Assets.images.avatar3.path,
      contentText:
          "Couldn't agree more! Failure is just a stepping stone on the path to success. Thanks for the motivation! 🔥",
      timeAgo: "19m",
      likes: "143",
      replies: "24",
      isFollow: true,
      userLikes: [
        UserLikes(photo: Assets.images.avatar6.path),
        UserLikes(photo: Assets.images.avatar2.path),
      ],
    )
  ];
}

List<UserModel> findUsers() {
  return [
    UserModel(
      name: "Mark Zuckerberg",
      profile: Assets.images.profilePic.path,
      username: "zuck",
      isVerified: true,
      followers: "143.2K",
    ),
    UserModel(
      name: "Agis R Herdiana",
      profile: Assets.images.profileAgis.path,
      username: "agis",
      isVerified: true,
      followers: "17.3K",
      friendsFollow: [
        FriendFollow(photo: Assets.images.avatar4.path),
        FriendFollow(photo: Assets.images.avatar6.path),
      ],
    ),
    UserModel(
      name: "Jacob Jones",
      profile: Assets.images.avatar1.path,
      username: "jones177_ jacob",
      isVerified: true,
      followers: "2.1K",
    ),
    UserModel(
      name: "Kristin Watson",
      profile: Assets.images.avatar2.path,
      username: "iamkristin_w",
      followers: "432",
    ),
    UserModel(
      name: "Cody Fisher",
      profile: Assets.images.avatar3.path,
      username: "cody-fisher@16",
      isVerified: true,
      followers: "1.1K",
    ),
    UserModel(
        name: "Albert Flores",
        profile: Assets.images.avatar4.path,
        username: "the_alfroresd",
        followers: "49"),
    UserModel(
        name: "Ralph Edwards",
        profile: Assets.images.avatar5.path,
        username: "ed.theguy",
        followers: "139"),
    UserModel(
      name: "Devon Lane",
      profile: Assets.images.avatar6.path,
      username: "theguy_withpen",
      followers: "14",
    ),
    UserModel(
      name: "Jerome Bell",
      profile: Assets.images.avatar7.path,
      username: "jerome_bell",
      followers: "654",
    ),
    UserModel(
      name: "Robert Fox",
      profile: Assets.images.avatar8.path,
      username: "robert_fox",
      followers: "155",
    ),
  ];
}

List<ActivityModel> activity() {
  return [
    ActivityModel(
      username: "iamnalimov",
      profile: Assets.images.avatar1.path,
      type: "following",
      timeAgo: "12s",
    ),
    ActivityModel(
      username: "lily.rose",
      profile: Assets.images.avatar2.path,
      type: "follow_request",
      timeAgo: "1m",
    ),
    ActivityModel(
      username: "gamer-clan_boys",
      profile: Assets.images.avatar3.path,
      type: "following",
      timeAgo: "1m",
      isFollowing: true,
    ),
    ActivityModel(
      username: "beautyguru",
      profile: Assets.images.avatar4.path,
      type: "following",
      timeAgo: "15m",
    ),
    ActivityModel(
      username: "ethan.wright",
      profile: Assets.images.avatar5.path,
      type: "following",
      timeAgo: "1h",
    ),
    ActivityModel(
      username: "d.gr8_designer",
      profile: Assets.images.avatar6.path,
      type: "following",
      timeAgo: "1d",
    ),
    ActivityModel(
      username: "dream_soul.world",
      profile: Assets.images.avatar7.path,
      type: "following",
      timeAgo: "1w",
    ),
  ];
}

List<FeedModel> threads() {
  return [
    FeedModel(
      name: "agis",
      isVerified: true,
      profile: Assets.images.profileAgis.path,
      contentText:
          "Here’s to the crazy ones. The misfits. The rebels. The troublemakers. The round pegs in the square holes.",
      timeAgo: "33m",
      likes: "17.2K",
      replies: "3,339",
      isFollow: true,
      userLikes: [
        UserLikes(photo: Assets.images.avatar1.path),
        UserLikes(photo: Assets.images.avatar2.path),
      ],
    ),
    FeedModel(
      name: "agis",
      isVerified: true,
      profile: Assets.images.profileAgis.path,
      contentText:
          "Here’s this is figma's implementation of UI threads using Flutter and BLoC state management 🚀",
      timeAgo: "1h",
      likes: "6K",
      replies: "231",
      isFollow: true,
      userLikes: [
        UserLikes(photo: Assets.images.avatar4.path),
        UserLikes(photo: Assets.images.avatar5.path),
      ],
    ),
    FeedModel(
      name: "agis",
      isVerified: true,
      profile: Assets.images.profileAgis.path,
      contentText:
          "I love the idea of turning setbacks into opportunities for growth. It's all about the mindset! 💪",
      timeAgo: "26m",
      likes: "54",
      replies: "2",
      isFollow: true,
      contentPhoto: Assets.images.postImage.path,
      userLikes: [
        UserLikes(photo: Assets.images.avatar3.path),
        UserLikes(photo: Assets.images.avatar1.path),
      ],
    ),
    FeedModel(
      name: "agis",
      isVerified: true,
      profile: Assets.images.profileAgis.path,
      contentText:
          "Let's talk about the incredible power of perseverance and how it can change your life. ",
      timeAgo: "2h",
      likes: "135",
      replies: "12",
      isFollow: true,
      userLikes: [
        UserLikes(photo: Assets.images.avatar1.path),
        UserLikes(photo: Assets.images.avatar3.path),
      ],
    ),
    FeedModel(
      name: "agis",
      isVerified: true,
      profile: Assets.images.profileAgis.path,
      contentText:
          "Couldn't agree more! Failure is just a stepping stone on the path to success. Thanks for the motivation! 🔥",
      timeAgo: "19m",
      likes: "143",
      replies: "24",
      isFollow: true,
      userLikes: [
        UserLikes(photo: Assets.images.avatar6.path),
        UserLikes(photo: Assets.images.avatar2.path),
      ],
    )
  ];
}
