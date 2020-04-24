import 'dart:io';

import 'package:flutter/material.dart';
import 'package:new_app/models/user_model.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:new_app/models/message_model.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_app/screens/CallScreen.dart';
import 'package:new_app/screens/ProfileScreen.dart';

class ChatScreen extends StatefulWidget {
  final User user;
  ChatScreen({
    this.user,
  });
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Color lightblack = Color(0xff1F2835);
  Color lightwhite = Colors.white38;
  Color sendButtonColor = Colors.white38;
  Color iconColor = Colors.white;
  bool isWriting = false;
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_checkInputLength);
  }

  void _checkInputLength() {
    int length = _controller.text.length;
    Color color;
    if (length > 0) {
      color = Color(0xff3f72af);
      setState(() {
        sendButtonColor = color;
      });
    } else {
      setState(() {
        sendButtonColor = lightwhite;
      });
    }
  }

  _buildMessage(Messages chats, bool isMe) {
    final align = isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final bg = isMe ? Color(0xff3f72af) : lightblack;
    final radius = isMe
        ? BorderRadius.only(
            topLeft: Radius.circular(5.0),
            bottomLeft: Radius.circular(5.0),
            topRight: Radius.circular(10.0))
        : BorderRadius.only(
            topLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(5.0),
            topRight: Radius.circular(5.0));
    final margin =
        isMe ? EdgeInsets.only(left: 100.0) : EdgeInsets.only(right: 100.0);
    final Color textColor = Colors.white70;
    final timeColor = Colors.white38;
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: align,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            margin: margin,
            decoration:
                BoxDecoration(color: bg, borderRadius: radius, boxShadow: [
              BoxShadow(
                  blurRadius: .3,
                  spreadRadius: 0.3,
                  color: Colors.black.withOpacity(.09))
            ]),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 40.0),
                  child: Text(
                    chats.text,
                    style: TextStyle(
                        fontFamily: 'SourceSansProRegular',
                        fontSize: 16.0,
                        color: textColor),
                  ),
                ),
                Positioned(
                  right: 0.0,
                  bottom: 0.0,
                  child: Text(
                    chats.time,
                    style: TextStyle(fontSize: 10.0, color: timeColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  setWritingTo(bool val) {
    setState(() {
      isWriting = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueGrey.shade50,
      backgroundColor: Color(0xff171C27),
      appBar: AppBar(
        // backgroundColor: Theme.of(context).primaryColor,
        backgroundColor: Color(0xff1F2835),
        elevation: .9,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: iconColor,
          iconSize: 25.0,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                border: Border.all(
                    width: 1.0, color: Theme.of(context).primaryColor),
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage(widget.user.imageUrl[0]),
                radius: 15.0,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              StringUtils.capitalize(widget.user.name),
              style: TextStyle(
                  fontFamily: 'SourceSansProBold',
                  fontSize: 18.0,
                  color: Theme.of(context).primaryColor),
            ),
            SizedBox(width: 5.0,),
            widget.user.online ? Container(
              margin: EdgeInsets.only(top: 5.0),
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 5.0,
              ),
            ) : Container(),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.phone),
            iconSize: 25.0,
            color: iconColor,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => CallScreen(
                            user: widget.user,
                          )));
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            iconSize: 25.0,
            color: iconColor,
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return SimpleDialog(
                    title: Text(
                      StringUtils.capitalize(widget.user.name),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontFamily: 'SourceSansProBold'),
                    ),
                    children: <Widget>[
                      SimpleDialogOption(
                        onPressed: () {
                          Navigator.of(context).pop();
                          _showConfirmationDialog(1);
                        },
                        child: Text(
                          'Unfriend',
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 16.0,
                              fontFamily: 'SourceSansProRegular'),
                        ),
                      ),
                      SimpleDialogOption(
                        onPressed: () {
                          Navigator.of(context).pop();
                          _showConfirmationDialog(2);
                        },
                        child: Text(
                          'Block',
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 16.0,
                              fontFamily: 'SourceSansProRegular'),
                        ),
                      ),
                      SimpleDialogOption(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 20.0),
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'CLOSE',
                            style: TextStyle(
                                color: Theme.of(context).backgroundColor,
                                fontSize: 14.0,
                                fontFamily: 'SourceSansSemiBold'),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: chat.length,
                itemBuilder: (BuildContext context, int index) {
                  final chats = chat[index];
                  final bool isMe = chats.sender.id == currentUser.id;
                  return _buildMessage(chats, isMe);
                },
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.newline,
                      // textInputAction: TextInputAction.send,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      minLines: 1,
                      maxLines: 3,
                      cursorColor: iconColor,
                      onChanged: (value) {
                        (value.length > 0 && value.trim() != "")
                            ? setWritingTo(true)
                            : setWritingTo(false);
                      },
                      decoration: InputDecoration(
                        hintText: 'Write a message',
                        hintStyle: TextStyle(
                            fontFamily: 'SourceSansProRegular',
                            color: lightwhite),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                        filled: true,
                        fillColor: Theme.of(context).accentColor,
                        suffixIcon: IconButton(
                          iconSize: 25.0,
                          icon: Icon(Icons.mood),
                          color: iconColor,
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                  isWriting
                      ? Container(
                          margin: EdgeInsets.only(left: 10.0, right: 5.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: sendButtonColor),
                          child: IconButton(
                            icon: Icon(Icons.send),
                            iconSize: 25.0,
                            color: iconColor,
                            onPressed: () {},
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.record_voice_over),
                                iconSize: 25.0,
                                color: iconColor,
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.attach_file),
                                iconSize: 25.0,
                                color: iconColor,
                                onPressed: () {
                                  getFilePath();
                                },
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog(int index) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text('Are You Sure!!'),
          content: index == 1
              ? Text('Do You want to Unfriend this user?')
              : Text('Do You want to Block this user?'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Yes'),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }

  void getFilePath() async {
    File filePath = await ImagePicker.pickImage(source: ImageSource.gallery);
  }
}
