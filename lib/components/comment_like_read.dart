import 'package:flutter/material.dart';
import 'package:music_flutter/config/app_colors.dart';
import 'package:music_flutter/utils/util.dart';

class CommentLikeRead extends StatelessWidget {
  final int commentCount;
  final int thumbUpCount;
  final int readCount;

  const CommentLikeRead(
      {Key? key,
      required this.commentCount,
      required this.thumbUpCount,
      required this.readCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        getItem(commentCount),
        getItem(thumbUpCount),
        getItem(readCount)
      ],
    );
  }

  Widget getItem(int count) {
    return Expanded(
      child: Row(
        children: [
          Icon(
            Icons.message_outlined,
            size: 14,
          ),
          SizedBox(width: 4,),
          Expanded(
            child: Text(
              formCharCount(count),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12, color: AppColors.unactive),
            ),
          )
        ],
      ),
    );
  }
}
