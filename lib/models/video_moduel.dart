import 'package:music_flutter/models/user_model.dart';

class VideoList {
  final List<VideoItem> list;

  VideoList(this.list);

  factory VideoList.fromJson(List<dynamic> list) {
    return VideoList(list.map((e) => VideoItem.fromJson(e)).toList());
  }
}

class VideoItem {
  final int id;
  final int userid;
  final String coverPictureUrl;
  final String videoUrl;
  final String title;
  final String intro;
  final int commentCount;
  final int readCount;
  final int thumbUpCount;
  final int shareCount;
  final int contentSeconds;
  final UserItem user;

  VideoItem(
      {required this.id,
      required this.userid,
      required this.coverPictureUrl,
      required this.videoUrl,
      required this.title,
      required this.intro,
      required this.commentCount,
      required this.readCount,
      required this.thumbUpCount,
      required this.shareCount,
      required this.contentSeconds,
      required this.user});

  factory VideoItem.fromJson(dynamic item) {
    return VideoItem(
        id: item['id'],
        userid: item['userId'],
        coverPictureUrl: item['coverPictureUrl'],
        videoUrl: item["videoUrl"],
        title: item['title'],
        intro: item['intro'],
        commentCount: item["commentCount"],
        readCount: item["readCount"],
        thumbUpCount: item['thumbUpCount'],
        shareCount: item['shareCount'],
        contentSeconds: item['contentSeconds'],
        user: UserItem.formJson(item['User']));
  }
}
