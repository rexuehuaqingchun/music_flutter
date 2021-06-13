import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:music_flutter/components/song_card.dart';
import 'package:music_flutter/models/song_model.dart';
import 'package:music_flutter/services/song_service.dart';

class SongPage extends StatefulWidget {
  const SongPage({Key? key}) : super(key: key);

  @override
  _SongPageState createState() => _SongPageState();
}

class _SongPageState extends State<SongPage>
    with AutomaticKeepAliveClientMixin {
  List<SongItem> _songList = SongList([]).list;

  int page = 1;
  int limit = 10;
  bool hasMore = true;
  bool error = false;
  String errorMsg = '';

  late EasyRefreshController _easyRefreshController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _easyRefreshController = new EasyRefreshController();
    _getSongs();
  }

  Future _getSongs({bool push = true}) async {
    try {
      Map<String, dynamic> result = await SongService.getSongs(page: page);
      SongList songList = SongList.fromJson(result['list']);
      setState(() {
        hasMore = page * limit < result['total'];
        page++;
        if (push) {
          _songList.addAll(songList.list);
        } else {
          _songList = songList.list;
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
      onRefresh: _onRefresh,
      onLoad: _onLoad,
      enableControlFinishLoad: true,
      enableControlFinishRefresh: true,
      header: ClassicalHeader(),
      footer: ClassicalFooter(),
      controller: _easyRefreshController,
      child: ListView.builder(
        itemCount: _songList.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              const SizedBox(height: 8),
              SongCard(songItem: _songList[index]),
            ],
          );
        },
      ),
    );
  }

  Future<void> _onRefresh() async {
    page = 1;
    await _getSongs();
    _easyRefreshController.finishRefresh();
    _easyRefreshController.resetLoadState();
  }

  Future<void> _onLoad() async {
    if (hasMore) {
      await _getSongs();
    }
    _easyRefreshController.finishLoad(noMore: !hasMore);
  }

  @override
  bool get wantKeepAlive => true;
}
