import 'package:flutter/material.dart';
import 'package:music_flutter/welcom.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music_Flutter',
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

