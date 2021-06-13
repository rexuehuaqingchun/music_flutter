import 'package:music_flutter/http/Http.dart';

class UserService {
  static const String rootPath = '/user';
  static const String listPath = '$rootPath/list';
  static const String infoPath = '$rootPath/info';

  static Future getUsers ({int page = 1, int limit = 10,String? type}) async {
    Map<String,dynamic> response = await Http.post(
        listPath,
        data: {'page': page, 'limit': limit,'type':type}
        );
    Map<String,dynamic> result = response['data'];
    return result;
  }
}
