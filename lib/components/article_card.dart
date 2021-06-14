import 'package:flutter/material.dart';
import 'package:music_flutter/components/avatat_role_name.dart';
import 'package:music_flutter/components/comment_like_read.dart';
import 'package:music_flutter/config/app_colors.dart';
import 'package:music_flutter/models/article_model.dart';

class ArticleCard extends StatelessWidget {
  ArticleItem articleItem;

  ArticleCard({Key? key, required this.articleItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> urls = articleItem.coverUrlList.split(',').toList();
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            articleItem.Title,
            style: TextStyle(fontSize: 14, color: AppColors.active),
          ),
          SizedBox(height: 20,),
          _getImages(urls),
          SizedBox(height: 20,),
          _bottomWidget()
        ],
      ),
    );
  }

  Widget _getImages(List<String> urls) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: FadeInImage.assetNetwork(
        placeholder: '',
        image: urls[0],
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _bottomWidget(){
    return Row(
      children: [
        Expanded(
          child: AvatarRoleName(
              avatar: articleItem.user.coverPictureUrl,
              nickname: articleItem.user.nickname,
              type:  articleItem.user.type),
        ),
        Expanded(
          child: CommentLikeRead(
              commentCount: articleItem.commentCount,
              thumbUpCount: articleItem.thumbUpCount,
              readCount: articleItem.readCount),
        )
      ],
    );
  }
}
