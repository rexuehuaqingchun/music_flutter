import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:music_flutter/components/singer_card.dart';
import 'package:music_flutter/components/video_card.dart';
import 'package:music_flutter/models/user_model.dart';
import 'package:music_flutter/models/video_moduel.dart';
import 'package:music_flutter/services/user_service.dart';
import 'package:music_flutter/services/video_service.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage>
    with AutomaticKeepAliveClientMixin {
  List<VideoItem> _videoList = VideoList([]).list;

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
    //_getVideos();
  }

  Future _getVideos({bool push = true}) async {
    try {
      Map<String, dynamic> result = await VideoService.getVideos(page: page);
      VideoList userList = VideoList.fromJson(result['list']);
      setState(() {
        hasMore = page * limit < result['total'];
        page++;
        if (push) {
          _videoList.addAll(userList.list);
        } else {
          _videoList = userList.list;
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
        itemCount: _videoList.length,
        itemBuilder: (BuildContext buildContext, int index) {
          VideoItem videoItem = _videoList[index];
          bool isEven = index.isEven;
          double pl = isEven ? 18 : 9;
          double pr = isEven ? 9 : 18;
          return Container(
            padding: EdgeInsets.only(top: 18, left: pl, right: pr),
            decoration: const BoxDecoration(color: Colors.white),
            child: VideoCard(
              videoItem: videoItem,
            ),
          );
        },
        padding: const EdgeInsets.only(top: 8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 1,
          childAspectRatio: 1 / 2
        )
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Future<void> _onRefresh() async {
    page = 1;
    await _getVideos(push: false);
    _easyRefreshController.finishRefresh();
    _easyRefreshController.resetLoadState();
  }

  Future<void> _onLoad() async {
    if (hasMore) {
      await _getVideos();
    }
    _easyRefreshController.finishLoad(noMore: !hasMore);
  }
}
