import 'package:flutter/material.dart';
import 'package:music_flutter/components/singer_card.dart';
import 'package:music_flutter/models/user_model.dart';
import 'package:music_flutter/services/user_service.dart';

class SingerPage extends StatefulWidget {
  const SingerPage({Key? key}) : super(key: key);

  @override
  _SingerPageState createState() => _SingerPageState();
}

class _SingerPageState extends State<SingerPage> {
  List<UserItem> _singerList = UserList([]).list;

  int page = 1;
  int limit = 10;
  bool haseMore = true;
  bool error = false;
  String errorMsg = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSingers();
  }

  Future _getSingers({bool push = true}) async {
    try {
      Map<String, dynamic> result =
          await UserService.getUsers(page: page, type: 'DQ_SINGER');
      UserList userList = UserList.fromJson(result['list']);
      setState(() {
        haseMore = page * limit < result['total'];
        page++;
        if (push) {
          _singerList.addAll(userList.list);
        } else {
          _singerList = userList.list;
        }
      });
    } catch (e) {
      error = true;
      errorMsg = e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _singerList.length,
      itemBuilder: (BuildContext context, int index) {
        UserItem userItem = _singerList[index];
        return Column(
          children: [
            const SizedBox(height: 8),
            SingerCard(
              coverPictureUrl: userItem.coverPictureUrl,
              nickname: userItem.nickname,
              musicCount: userItem.musicCount,
              musicPlayCount: userItem.musicPlayCount,
            ),
          ],
        );
      },
    );
  }
}
