import 'package:flutter/material.dart';
import 'package:music_flutter/components/avatat_role_name.dart';
import 'package:music_flutter/components/comment_like_read.dart';
import 'package:music_flutter/config/app_colors.dart';
import 'package:music_flutter/models/song_model.dart';
import 'package:music_flutter/utils/util.dart';

class SongCard extends StatelessWidget {
  final SongItem songItem;

  const SongCard({Key? key, required this.songItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(toRpx(context, 40)),
      child: Row(
        children: [
          _songCover(),
          SizedBox(width: 8),
           _songContent()],
      ),
    );
  }

  Widget _songCover() {
    return SizedBox(
      width: 75,
      height: 75,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage.assetNetwork(
              placeholder: "",
              image: songItem.coverPictureUrl,
              fit: BoxFit.cover,
            ),
          ),
          const Center(
            child: Icon(
              Icons.play_circle_outline,
              size: 22,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _songContent() {
    return Expanded(
        child: SizedBox(
          height: 75,
          child: Stack(
            children: [
              Text(
                songItem.cnName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: AppColors.active, fontSize: 16),
              ),
              Positioned(
                top: 25,
                child: Text(
                  songItem.enName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      const TextStyle(fontSize: 14, color: AppColors.un3active),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    SizedBox(
                      width: 120,
                      child: AvatarRoleName(
                        avatar: songItem.user.nickname,
                        nickname: songItem.user.nickname,
                        showType: true,
                        type: songItem.user.type,
                      ),
                    ),
                     Expanded(
                        child: CommentLikeRead(
                          commentCount: songItem.commentCount,
                          thumbUpCount: songItem.thumbUpCount,
                          readCount: songItem.readCount,
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
  }
}
