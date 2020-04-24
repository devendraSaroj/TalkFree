 import 'package:flutter/material.dart';
import 'package:new_app/widgets/RecentChats.dart';

 class Home extends StatefulWidget
 {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        centerTitle: true,
        leading: Container(), // to remove the default back button
        title: Text(
          'Messages',
          style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'sourceSansProBold',
              color: Colors.white),
        ),
        elevation: 0.9,
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.more_vert),
        //     iconSize: 30.0,
        //     color: Colors.white,
        //     onPressed: () {},
        //   ),
        // ],
      ),
          body: Container(
          color: Theme.of(context).backgroundColor,
          child: Column(
            children: <Widget>[
              // CategorySelector(),
              RecentChats(),
            ],
          ),
        ),
    );
  }
}