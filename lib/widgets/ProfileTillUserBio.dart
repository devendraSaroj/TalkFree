import 'package:flutter/material.dart';
import 'package:new_app/models/message_model.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:new_app/models/user_model.dart';
import 'package:new_app/screens/EditProfile.dart';
import 'package:new_app/screens/FullScreenImageView.dart';

class ProfileTillUserBio extends StatefulWidget {
  final User user;
  ProfileTillUserBio({
    this.user,
  });
  @override
  _ProfileTillUserBioState createState() => _ProfileTillUserBioState();
}

class _ProfileTillUserBioState extends State<ProfileTillUserBio> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                    builder: (_) {
                      return EditProfile();
                    }
                  ));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.22,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          image: AssetImage('assets/images/edit.png'),
                          height: 20.0,
                          width: 20.0,
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        Text(
                          'Edit',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontFamily: 'SourceSansProSemiBold'),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.22,
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  // alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage('assets/images/coin.png'),
                        height: 20.0,
                        width: 20.0,
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        widget.user.coinValue.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: 'SourceSansProSemiBold'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return FullScreenImageView(
                    user: widget.user,
                    length: 1,
                  );
                }));
              },
              child: Container(
                height: 130.0,
                width: 130.0,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.all(Radius.circular(10.0)),

                  image: DecorationImage(
                    image: AssetImage(currentUser.imageUrl[0]),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            StringUtils.capitalize(currentUser.name),
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20.0,
                fontFamily: 'SourceSansProSemiBold'),
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.42,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'GENDER',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            fontFamily: 'SourceSansProRegular'),
                      ),
                      Text(
                        currentUser.gender,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontFamily: 'SourceSansProSemiBold'),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.42,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            fontFamily: 'SourceSansProRegular'),
                      ),
                      Text(
                        currentUser.age,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontFamily: 'SourceSansProSemiBold'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: Wrap(
              children: <Widget>[
                Text(
                  userBio,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SourceSansProRegular',
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Photo's",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontFamily: 'SourceSansProSemiBold',
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
