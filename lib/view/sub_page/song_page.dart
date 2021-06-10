
import 'package:flutter/material.dart';
import 'package:music_flutter/components/song_card.dart';
import 'package:music_flutter/models/song_model.dart';
import 'package:music_flutter/services/song_service.dart';

class SongPage extends StatefulWidget {
  const SongPage({Key? key}) : super(key: key);

  @override
  _SongPageState createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {

  List<SongItem> _songList = SongList([]).list;

  int page = 1;
  int limit = 10;
  bool haseMore = true;
  bool error = false;
  String errorMsg = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSongs();
  }

  Future _getSongs({bool push = true}) async{
    try{
      Map<String,dynamic> result = await SongService.getSongs(page: page);
      SongList songList = SongList.fromJson(result['list']);
      setState(() {
        haseMore = page * limit < result['total'];
        page++;
        if(push){
          _songList.addAll(songList.list);
        }else{
          _songList = songList.list;
        }
      });
    }catch(e){
      error = true;
      errorMsg = e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _songList.length,
      itemBuilder: (BuildContext context,int index){
        return Column(
          children: [
            const SizedBox(height: 8),
            SongCard(songItem: _songList[index]),
          ],
        );
      },
    );
  }
}
