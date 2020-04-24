import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:new_app/models/message_model.dart';
import 'package:new_app/models/user_model.dart';
import 'package:new_app/widgets/ProfileBelowPhotoListView.dart';
import 'package:new_app/widgets/ProfilePhotoListView.dart';
import 'package:new_app/widgets/ProfileTillUserBio.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        centerTitle: true,
        leading: Container(),
        title: Text(
          'My Profile',
          style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'SourceSansProBold',
              color: Colors.white),
        ),
        elevation: 0.9,
      ),
      body: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              ProfileTillUserBio(user: currentUser,),
              ProfilePhotoListView(user: currentUser,),
              ProfileBelowPhotoListView(),
            ],
        ),
      ),
    );
  }
}

