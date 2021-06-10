import 'package:flutter/material.dart';
import 'package:music_flutter/config/app_colors.dart';
import 'package:music_flutter/utils/util.dart';

class SingerCard extends StatelessWidget {
  final String coverPictureUrl;
  final String nickname;
  final int musicCount;
  final int musicPlayCount;
  const SingerCard(
      {Key? key,
      required this.coverPictureUrl,
      required this.nickname,
      required this.musicCount,
      required this.musicPlayCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1 / 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage.assetNetwork(
              placeholder: "",
              image: coverPictureUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            nickname,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16, color: AppColors.active),
          ),
        ),
        Row(
          children: [],
        )
      ],
    );
  }

  Widget _iconText(int count) {
    return Expanded(
      child: Row(
        children: [
          Icon(
            Icons.select_all,
            size: 16,
          ),
          Expanded(
            child: Text(
              '歌曲' + formCharCount(musicCount),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12, color: AppColors.unactive),
            ),
          ),
        ],
      ),
    );
  }
}
