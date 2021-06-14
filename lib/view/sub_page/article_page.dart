
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:music_flutter/components/article_card.dart';
import 'package:music_flutter/models/article_model.dart';
import 'package:music_flutter/services/article_service.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {

  List<ArticleItem> _articleList = ArticleList([]).list;
  bool hasMore = true;
  int page = 1;
  int limit = 10;
  String msg = '';
  bool error = false;

  late EasyRefreshController _easyRefreshController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _easyRefreshController = new EasyRefreshController();
    _getArticle();
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      controller: _easyRefreshController,
      header: ClassicalHeader(),
      footer: ClassicalFooter(),
      enableControlFinishLoad: true,
      enableControlFinishRefresh: true,
      onLoad: _onLoad,
      onRefresh: _onRefresh,
      child: ListView.builder(
        itemCount: _articleList.length,
        itemBuilder: (BuildContext context, int index) {
          return ArticleCard(articleItem: _articleList[index]);
        },

      ),
    );
  }

  Future<void> _getArticle({bool push = true}) async {
    try{
      Map<String,dynamic> result = await ArticleService.getArticle(page: 1);
      ArticleList articleList = ArticleList.fromJson(result['list']);
      setState(() {
        hasMore = limit * page < result['total'];
        page++;
        if(push){
          _articleList.addAll(articleList.list);
        }else{
          _articleList = articleList.list;
        }
      });
    }catch(e){
      error = true;
      msg = e.toString();
    }
  }

  Future<void> _onRefresh() async {
    page = 1;
    await _getArticle();
    _easyRefreshController.finishRefresh();
    _easyRefreshController.resetRefreshState();
  }

  Future<void> _onLoad() async {
    if(hasMore){
      await _getArticle(push: true);
    }
    _easyRefreshController.finishLoad(noMore: !hasMore);
  }
}

