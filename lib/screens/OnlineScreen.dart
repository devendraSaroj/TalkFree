import 'package:flutter/material.dart';
import 'package:new_app/widgets/OnlineUsers.dart';
import 'package:new_app/screens/HomeScreen.dart';
import 'package:new_app/models/message_model.dart';
import 'package:new_app/screens/ChatScreen.dart';
import 'package:new_app/screens/ProfileScreen.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class OnlineScreen extends StatefulWidget {
  @override
  _OnlineScreenState createState() => _OnlineScreenState();
}

class _OnlineScreenState extends State<OnlineScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff3f72af),
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        centerTitle: true,
        leading: Container(), // to remove the default back button
        title: Text(
          'Online Users',
          style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'sourceSansProBold',
              color: Colors.white),
        ),
        elevation: 0.9,
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: <Widget>[
            // CategorySelector(),
            OnlineUsers(),
          ],
        ),
      ),
      
    );
  }
}
