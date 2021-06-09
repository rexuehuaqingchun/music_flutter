import 'package:flutter/material.dart';
import 'package:music_flutter/components/root_page_head.dart';
import 'package:music_flutter/config/http_options.dart';
import 'package:music_flutter/http/Http.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  static const List<Tab> _tabs = [
    Tab(
      text: '歌曲',
    ),
    Tab(
      text: '推荐',
    ),
    Tab(
      text: '歌手',
    ),
    Tab(
      text: '小视频',
    ),
    Tab(
      text: '文章',
    ),
    Tab(
      text: '视频',
    ),
  ];

  final List<Widget> _tabsContent = [
    Text('歌曲'),
    Text('推荐'),
    Text('歌手'),
    Text('小视频'),
    Text('文章'),
    Text('视频'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(
      initialIndex: 1,
      length: _tabs.length,
      vsync: this,
    );
    Http.init(
      baseUrl: HttpOptions.BASE_URL,
      connectTimeout: HttpOptions.CONNECT_TIMEOUT,
      receiveTimeout: HttpOptions.RECEIVE_TIMEOUT);
      
      getList();
  }

  Future getList() async {
    final res = await Http.post('/recommend/list');
    // ignore: avoid_print
    print(res);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RootPageHead(),
        bottom: TabBar(
          tabs: _tabs,
          controller: _tabController,
          isScrollable: true,
        ),
      ),
      body: TabBarView(
        children: _tabsContent,
        controller: _tabController,
      ),
    );
  }
}