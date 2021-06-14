import 'package:music_flutter/models/user_model.dart';

class ArticleList {
  final List<ArticleItem> list;

  ArticleList(this.list);

  factory ArticleList.fromJson(List<dynamic> list) {
    return ArticleList(list.map((item) => ArticleItem.fromJson(item)).toList());
  }
}

class ArticleItem {
  /**
   * 	Id           uint   `json:"id"`
      UserId          uint   `json:"uid"`
      CoverUrlList string `json:"coverUrlList"`
      Title        string `json:"title"`
      CommentCount string `json:"commentCount"`
      ThumbUpCount uint   `json:"thumbUpCount"`
      ReadCount    uint   `json:"readCount"`
      User            *QueryUser `orm:"with:id=UserId"`
   */
  final int id;
  final int userid;
  final String coverUrlList;
  final String Title;
  final int commentCount;
  final int thumbUpCount;
  final int readCount;
  final UserItem user;

  ArticleItem(
      {required this.id,
      required this.userid,
      required this.coverUrlList,
      required this.Title,
      required this.commentCount,
      required this.thumbUpCount,
      required this.readCount,
      required this.user});

  factory ArticleItem.fromJson(dynamic item) {
    return ArticleItem(
      coverUrlList: item['coverUrlList'],
      Title: item['title'],
      commentCount: item['commentCount'],
      thumbUpCount: item['thumbUpCount'],
      readCount: item['readCount'],
      user: UserItem.formJson(item['User']),
      userid: item['userId'],
      id: item['id'],
    );
  }
}
