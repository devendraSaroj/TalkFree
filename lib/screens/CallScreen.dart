import 'package:flutter/material.dart';
import 'package:new_app/models/user_model.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:new_app/widgets/Timer.dart';

class CallScreen extends StatefulWidget {
  final User user;
  CallScreen({
    this.user,
  });
  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  bool pressMuteButtonAttention = false,
   pressSpeakerButtonAttention = false,
   threeBtnVisble = false;  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).backgroundColor,
        padding: EdgeInsets.only(
          top: 150.0,
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'VOICE CALL',
              style: TextStyle(
                  color: Colors.white38,
                  fontSize: 18.0,
                  fontFamily: 'SourceSansProSemiBold'),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              StringUtils.capitalize(widget.user.name),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontFamily: 'SourceSansProBold'),
            ),
            SizedBox(
              height: 20.0,
            ),
            CircleAvatar(
              backgroundImage: AssetImage(widget.user.imageUrl[0]),
              radius: 50.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              threeBtnVisble ? 'Connected' : 'Dialing...',
              style: TextStyle(
                  color: Colors.white38,
                  fontSize: 18.0,
                  fontFamily: 'SourceSansProBold'),
            ),
            SizedBox(
              height: 100.0,
            ),
            threeBtnVisble ? CountDownTimer(
           secondsRemaining: 480,
           whenTimeExpires: () {
              // setState(() {
              //   hasTimerStopped = true;
              // });
            },
            countDownTimerStyle: TextStyle(
                  color: Colors.white38,
                  fontSize: 22.0,
                  fontFamily: 'SourceSansProBold'),
            // countDownFormatter: (){},
          )
          :Text(''),
            SizedBox(
              height: 30.0,
            ),
            threeBtnVisble ? Container(                 
              width: MediaQuery.of(context).size.width * 0.6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  color: pressMuteButtonAttention ? Colors.white :Theme.of(context).accentColor,
                ),
                child: IconButton(
                  icon: Icon(Icons.volume_off),
                  iconSize: 25.0,
                  color: pressMuteButtonAttention ? Theme.of(context).accentColor : Colors.white38,
                  onPressed: (){
                    setState(() {
                      pressMuteButtonAttention = !pressMuteButtonAttention;
                    });
                  },
                ),
              ),
              Container(
                decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  color: pressSpeakerButtonAttention ? Colors.white :Theme.of(context).accentColor,
                ),
                child: IconButton(
                  icon: Icon(Icons.volume_up),
                  iconSize: 25.0,
                  color: pressSpeakerButtonAttention ? Theme.of(context).accentColor : Colors.white38,
                  onPressed: (){
                    setState(() {
                      pressSpeakerButtonAttention = !pressSpeakerButtonAttention;
                    });
                  },
                ),
              ),
              Container(
                decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  color: Colors.red,
                ),
                child: IconButton(
                  icon: Icon(Icons.call_end),
                  iconSize: 25.0,
                  color: Colors.white,
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                ),
              ),
                ],
              ),
            )
            // SizedBox(
            //   height: 10.0,
            // ),
           : Container(
              decoration: ShapeDecoration(
                shape: CircleBorder(),
                color: Colors.red,
              ),
              child: IconButton(
                icon: Icon(Icons.call_end),
                iconSize: 25.0,
                color: Colors.white,
                onPressed: (){
                  setState(() {
                    threeBtnVisble = true;
                  });
                  // Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
