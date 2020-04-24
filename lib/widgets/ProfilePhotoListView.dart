import 'package:flutter/material.dart';
import 'package:new_app/models/message_model.dart';
import 'package:new_app/models/user_model.dart';
import 'package:new_app/screens/FullScreenImageView.dart';
import 'package:new_app/screens/ProfileScreen.dart';
class ProfilePhotoListView extends StatefulWidget {
  final User user;
  ProfilePhotoListView({
    this.user,
  });
  @override
  _ProfilePhotoListViewState createState() => _ProfilePhotoListViewState();
}

class _ProfilePhotoListViewState extends State<ProfilePhotoListView> {
  _imageList(int index) {
    return Container(
        margin: EdgeInsets.only(top: 20.0, left: 20.0),
        width: 110.0,
        decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    color: Theme.of(context).accentColor,
    image: DecorationImage(
      image: AssetImage(widget.user.imageUrl[index]),
      fit: BoxFit.fill,
    ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height:150.0,
      color: Theme.of(context).backgroundColor,
      padding: EdgeInsets.only(right: 20.0),
      child: ListView.builder(
             itemCount: widget.user.imageUrl.length,
             scrollDirection: Axis.horizontal,
             itemBuilder: (BuildContext context, int index){
               return GestureDetector(
                 onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => FullScreenImageView(
                                user: widget.user,
                                currIndex: index,
                              )));
                
                 },
                 child: _imageList(index),
               );
             },
           ),
    );
  }
}