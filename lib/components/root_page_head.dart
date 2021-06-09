import 'package:flutter/material.dart';
import 'package:music_flutter/config/app_colors.dart';

class RootPageHead extends StatelessWidget {
  const RootPageHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.account_circle,size: 30,),
        Expanded(
            child:_searchContent(),
        ),
        Icon(Icons.add_a_photo_rounded,size: 30,),

      ],
    );
  }

  _searchContent() {
    return Container(
      height: 30,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      decoration: BoxDecoration(
        color: AppColors.page,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Icon(Icons.search,size: 18,color: Colors.black26,),
          ),
          Text(
            '搜索关键词',
            style: TextStyle(
                fontSize: 12,
                color: AppColors.un3active
            ),
          )
        ],
      ),
    );
  }
}
