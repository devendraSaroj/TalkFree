import 'package:flutter/material.dart';
import 'package:new_app/models/message_model.dart';
import 'package:new_app/screens/ChatScreen.dart';
import 'package:basic_utils/basic_utils.dart'; // to capitalize strings

class RecentChats extends StatefulWidget {
  @override
  _RecentChatsState createState() => _RecentChatsState();
}

class _RecentChatsState extends State<RecentChats> {
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
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ChatScreen(
                              user: chat[index].sender,
                            ))),
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
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                StringUtils.capitalize(chat[index].sender.name),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: 'SourceSansProBold',
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              SizedBox(height: 3.0),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.50,
                                child: Text(
                                  chat[index].text,
                                  style: TextStyle(
                                    color: chat[index].unread
                                        ? Color(0xff3f72af)
                                        : Colors.white38,
                                    fontSize: 15.0,
                                    letterSpacing: 0.5,
                                    fontFamily: chat[index].unread
                                        ? 'SourceSansProSemiBold'
                                        : 'SourceSansProRegular',
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            chat[index].time,
                            style: TextStyle(
                              color: chat[index].unread
                                  ? Color(0xff3f72af)
                                  : Colors.white38,
                              fontSize: 15.0,
                              fontFamily: 'SourceSansProRegular',
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          // chat[index].unread
                          //     ? Container(
                          //         width: 20.0,
                          //         height: 20.0,
                          //         decoration: BoxDecoration(
                          //           color: Color(0xff3f72af),
                          //           borderRadius: BorderRadius.circular(10.0),
                          //         ),
                          //         alignment: Alignment.center,
                          //         child: Text(
                          //           '1',
                          //           style: TextStyle(
                          //             color: Colors.white,
                          //             fontSize: 14.0,
                          //             fontWeight: FontWeight.w500,
                          //           ),
                          //         ),
                          //       )
                          //     : Text(''),
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
