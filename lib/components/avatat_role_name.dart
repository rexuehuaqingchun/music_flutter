import 'package:flutter/material.dart';
import 'package:music_flutter/config/app_colors.dart';
import 'package:music_flutter/utils/user_type.dart';

class AvatarRoleName extends StatelessWidget {
  final String avatar;
  final String nickname;
  final bool? showType;
  final String type;
  const AvatarRoleName(
      {Key? key,
      required this.avatar,
      required this.nickname,
      this.showType = true, 
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _avatar(), 
       Offstage(
        offstage: !showType!,
        child:  _role(),
       ),
        _nickName()],
    );
  }

  Widget _avatar() {
    return SizedBox(
      width: 20,
      height: 20,
      child: ClipOval(
        child: FadeInImage.assetNetwork(placeholder: "", image: avatar),
      ),
    );
  }

  Widget _nickName() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 6),
        child: Text(
          nickname,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: AppColors.un2active, fontSize: 14),
        ),
      ),
    );
  }

  Widget _role() {
    return Container(
      margin: EdgeInsets.only(left: 4),
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      decoration: BoxDecoration(
          color: UserType.formColor(type), borderRadius: BorderRadius.circular(4)),
      child: Text(
        UserType.formCn(type),
        style: TextStyle(
          fontSize: 10,
          color: Colors.white
        ),
      ),
    );
  }
}
