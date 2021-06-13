import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:music_flutter/components/singer_card.dart';
import 'package:music_flutter/models/user_model.dart';
import 'package:music_flutter/services/user_service.dart';

class SingerPage extends StatefulWidget {
  const SingerPage({Key? key}) : super(key: key);

  @override
  _SingerPageState createState() => _SingerPageState();
}

class _SingerPageState extends State<SingerPage>
    with AutomaticKeepAliveClientMixin {
  List<UserItem> _singerList = UserList([]).list;

  int page = 1;
  int limit = 10;
  bool hasMore = true;
  bool error = false;
  String errorMsg = '';

  late EasyRefreshController _easyRefreshController;

  @override
  void initState() {
    super.initState();
    _easyRefreshController = new EasyRefreshController();
    _getSingers();
  }

  Future _getSingers({bool push = true}) async {
    try {
      Map<String, dynamic> result = await UserService.getUsers(page: page);
      UserList userList = UserList.fromJson(result['list']);
      setState(() {
        hasMore = page * limit < result['total'];
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
    super.build(context);
    return EasyRefresh(
      controller: _easyRefreshController,
      onRefresh: _onRefresh,
      onLoad: _onLoad,
      header: ClassicalHeader(),
      footer: ClassicalFooter(),
      enableControlFinishLoad: true,
      enableControlFinishRefresh: true,
      child: GridView.builder(
        itemCount: _singerList.length,
        itemBuilder: (BuildContext buildContext, int index) {
          UserItem usrItem = _singerList[index];
          bool isEven = index.isEven;
          double pl = isEven ? 18 : 9;
          double pr = isEven ? 9 : 18;
          return Container(
            padding: EdgeInsets.only(top: 18, left: pl, right: pr),
            decoration: const BoxDecoration(color: Colors.white),
            child: SingerCard(
              coverPictureUrl: usrItem.coverPictureUrl,
              nickname: usrItem.nickname,
              musicCount: usrItem.musicCount,
              musicPlayCount: usrItem.musicPlayCount,
            ),
          );
        },
        padding: const EdgeInsets.only(top: 8),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
            mainAxisExtent: MediaQuery.of(context).size.width / 1.5,
            mainAxisSpacing: 8,
            crossAxisSpacing: 1),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Future<void> _onRefresh() async {
    await _getSingers();
    _easyRefreshController.finishRefresh();
    _easyRefreshController.resetRefreshState();
  }

  Future<void> _onLoad() async {
    if (hasMore) {
      await _getSingers();
    }
    _easyRefreshController.finishLoad(noMore: !hasMore);
  }
}
