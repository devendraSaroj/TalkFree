import 'package:flutter/material.dart';
import 'package:new_app/screens/EditProfile.dart';
import 'package:new_app/screens/MyAccount.dart';
import 'package:new_app/screens/OnlineScreen.dart';
import 'package:new_app/widgets/home.dart';

// import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget currentwid=Home();
  int _currentIndex = 0;
  List<Widget> bodyWid=[
    Home(),
    OnlineScreen(),
    // EditProfile(),
    MyAccount(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: currentwid,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            currentwid=bodyWid[index];
          });
        },
        backgroundColor: Color(0xff1F2835),
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.white38,
        selectedItemColor: Color(0xff3f72af),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            title: Text(
              'Messages',
              style: TextStyle(fontFamily: 'SourceSansProBold'),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            title: Text(
              'Online',
              style: TextStyle(fontFamily: 'SourceSansProBold'),
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity),
              title: Text(
                'My Account',
                style: TextStyle(fontFamily: 'SourceSansProBold'),
              )),
        ],
      ),
    );
  }
}
