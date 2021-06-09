import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_flutter/view/root_pages/home_page.dart';
import 'package:music_flutter/view/root_pages/music_page.dart';
import 'package:music_flutter/view/root_pages/profile_page.dart';
import 'package:music_flutter/view/root_pages/video_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

const Map _bottomNames = {
  'home':'首页',
  'music':'音乐',
  'create_media':'',
  'tiny_video':'小视频',
  'profile':'我的'
};

class _RootPageState extends State<RootPage> {
  int _currentIndex = 0;
  final List<BottomNavigationBarItem> _bottomNavBatItemList = [];

  final List<Widget> _pages = [
    HomePage(),
    MusicPage(),
    Container(),
    VideoPage(),
    ProfilePage()
  ];

  bool _midIconIsChecked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bottomNames.forEach((key, value) {
      _bottomNavBatItemList.add(_bottomNavigationBarItem(key, value));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavBatItemList,
        currentIndex: _currentIndex,
        onTap: _onTabClick,
        type: BottomNavigationBarType.fixed,
      ),
      floatingActionButton: _createMediaButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _createMediaButton(){
    return Container(
      width: 44,
      height: 44,
      margin: EdgeInsets.only(top: 56),
      child: FloatingActionButton(
        child: Icon(
          Icons.account_balance,size: 24,color: _midIconIsChecked
            ? Colors.red : Colors.indigoAccent,
        ),
        onPressed: _MediaButtonClick,
      ),
    );
  }

  void _onTabClick(int index) {
    setState(() {
      if(index == 2){
        _MediaButtonClick();
        return;
      }
      _midIconIsChecked = false;
      _currentIndex = index;
    });
  }

  BottomNavigationBarItem _bottomNavigationBarItem(String iconName,String name){
    return BottomNavigationBarItem(
      icon: Icon(Icons.ac_unit,size: 24,color: Colors.green,),
      activeIcon: Icon(Icons.access_alarm,size: 24,color:Colors.red,),
      label: name
    );
  }

  void _MediaButtonClick() {
    setState(() {
      _midIconIsChecked = true;
      _currentIndex = 2;
    });
  }
}
