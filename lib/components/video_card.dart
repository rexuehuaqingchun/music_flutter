import 'package:flutter/material.dart';
import 'package:music_flutter/components/avatat_role_name.dart';
import 'package:music_flutter/components/comment_like_read.dart';
import 'package:music_flutter/models/user_model.dart';
import 'package:music_flutter/models/video_moduel.dart';

class VideoCard extends StatelessWidget {
  final VideoItem videoItem;

  const VideoCard({Key? key, required this.videoItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserItem userItem = videoItem.user;
    return Column(
      children: [
        _cover(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: AvatarRoleName(
              avatar: userItem.coverPictureUrl,
              nickname: userItem.nickname,
              type: userItem.type),
        ),
        CommentLikeRead(
            commentCount: videoItem.commentCount,
            thumbUpCount: videoItem.thumbUpCount,
            readCount: videoItem.readCount)
      ],
    );
  }

  Widget _cover() {
    return AspectRatio(
      aspectRatio: 9 / 16,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            child: FadeInImage.assetNetwork(
                fit: BoxFit.cover,
                placeholder: '',
                image: videoItem.coverPictureUrl),
            borderRadius: BorderRadius.circular(10),
          ),
          Center(
            child: Icon(
              Icons.play_circle_outline,
              size: 38,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
