import 'package:music_flutter/http/Http.dart';

class ArticleService {
  static const String rootPath = '/article';
  static const String listPath = '$rootPath/list';
  static const String infoPath = '$rootPath/info';

  static Future getArticle ({int page = 1, int limit = 10}) async {
    Map<String,dynamic> response = await Http.post(
        listPath,
        data: {'page': page, 'limit': limit,}
    );
    Map<String,dynamic> result = response['data'];
    return result;
  }
}
