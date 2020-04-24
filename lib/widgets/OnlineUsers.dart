import 'package:flutter/material.dart';
import 'package:new_app/models/message_model.dart';
import 'package:basic_utils/basic_utils.dart'; // to capitalize strings
import 'package:new_app/screens/ProfileScreen.dart';

class OnlineUsers extends StatefulWidget {
  @override
  _OnlineUsersState createState() => _OnlineUsersState();
}

class _OnlineUsersState extends State<OnlineUsers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: ListView.builder(
          itemCount: chat.length,
          itemBuilder: (BuildContext context, int index) {
            return Material(
              color: Theme.of(context).backgroundColor,
              child: InkWell(
                splashColor: Theme.of(context).accentColor,
                onTap: () {
                  
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (_) => ProfileScreen(
                  //              user: chat[index].sender
                  //             )));

                  Navigator.push(context, MaterialPageRoute(
                    builder: (_) {
                      return ProfileScreen(user: chat[index].sender);
                    }
                  ));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                              border: Border.all(
                                  width: 1.0,
                                  color: Theme.of(context).primaryColor),
                            ),
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage(chat[index].sender.imageUrl[0]),
                              radius: 25.0,
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    StringUtils.capitalize(
                                        chat[index].sender.name),
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: 'SourceSansProBold',
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  chat[index].sender.online
                                      ? Container(
                                          // margin: EdgeInsets.only(top: 2.0),
                                          padding: EdgeInsets.only(
                                              left: 5.0, right: 5.0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(3.0)),
                                            color: Colors.green,
                                          ),
                                          child: Text(
                                            'Online',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontFamily:
                                                    'SourceSansProRegular',
                                                fontSize: 12.0),
                                          ),
                                        )
                                      : Text(''),
                                ],
                              ),
                              SizedBox(height: 3.0),
                              Row(
                                children: <Widget>[
                                  Text(
                                    chat[index].sender.age,
                                    style: TextStyle(
                                      color: Colors.white38,
                                      fontSize: 15.0,
                                      letterSpacing: 0.5,
                                      fontFamily: 'SourceSansProRegular',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    chat[index].sender.gender,
                                    style: TextStyle(
                                      color: Colors.white38,
                                      fontSize: 15.0,
                                      letterSpacing: 0.5,
                                      fontFamily: 'SourceSansProRegular',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          IconButton(
                            icon: chat[index].sender.onCall
                                ? Icon(Icons.phone_in_talk)
                                : Icon(Icons.phone),
                            iconSize: 25.0,
                            color: chat[index].sender.onCall
                                ? Color(0xff0c3566)
                                : Color(0xff3f72af),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
