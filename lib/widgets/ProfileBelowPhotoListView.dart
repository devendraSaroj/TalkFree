import 'package:flutter/material.dart';
import 'package:new_app/models/message_model.dart';

class ProfileBelowPhotoListView extends StatefulWidget {
  @override
  _ProfileBelowPhotoListViewState createState() =>
      _ProfileBelowPhotoListViewState();
}

class _ProfileBelowPhotoListViewState extends State<ProfileBelowPhotoListView> {
  List<String> list = ["Privacy Policy", "Terms & Condition"];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: EdgeInsets.only(bottom: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontFamily: 'SourceSansProSemiBold',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 140.0,
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
            child: ListView.builder(
              itemCount: 2,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    list[index],
                    style: TextStyle(color: Colors.white, fontSize: 20.0, fontFamily: 'SourceSansProSemiBold',),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: Text(
              'Log Out',
              style: TextStyle(color: Colors.white, fontSize: 20.0, fontFamily: 'SourceSansProSemiBold',),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Align(
            alignment: Alignment.center,
                      child: Text(
              'Version - 1.0.052',
              style: TextStyle(color: Colors.white38, fontSize: 16.0, fontFamily: 'SourceSansProRegular',),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: Text(
              'DELETE ACCOUNT',
              style: TextStyle(color: Colors.red, fontSize: 20.0, fontFamily: 'SourceSansProSemiBold',),
            ),
          ),
        ],
      ),
    );
  }
}
