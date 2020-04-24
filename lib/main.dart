import 'package:flutter/material.dart';
import 'package:new_app/screens/HomeScreen.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SourceSansPro',
        // backgroundColor: Color(0xffdec016),
        backgroundColor: Color(0xff171C27),
        primaryColor: Colors.white,
        accentColor: Color(0xff1F2835),
        
      ),
      home: HomeScreen(),
    );
  }
}
