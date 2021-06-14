import 'package:music_flutter/http/Http.dart';

class VideoService {
  static const String rootPath = '/video';
  static const String listPath = '$rootPath/list';
  static const String infoPath = '$rootPath/info';

  static Future getVideos ({int page = 1, int limit = 10}) async {
    Map<String,dynamic> response = await Http.post(
        listPath,
        data: {'page': page, 'limit': limit,}
    );
    Map<String,dynamic> result = response['data'];
    return result;
  }
}
