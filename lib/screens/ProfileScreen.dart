import 'package:flutter/material.dart';
import 'package:new_app/models/user_model.dart';
import 'package:new_app/screens/CallScreen.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:new_app/screens/FullScreenImageView.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  ProfileScreen({
    this.user,
  });
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int ind = 0, _curouselIndex = 0;

  CarouselSlider carouselSlider;
  List imgList = [];

  void addImageToList() {
    for (int i = 0; i < widget.user.imageUrl.length; i++) {
      imgList.add(widget.user.imageUrl[i]);
    }
  }

  @override
  void initState() {
    super.initState();
    addImageToList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Theme.of(context).primaryColor,
          iconSize: 25.0,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Profile',
          style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'sourceSansProBold',
              color: Colors.white),
        ),
        elevation: 0.9,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              color: Theme.of(context).backgroundColor,
              child: CarouselSlider(
                height: MediaQuery.of(context).size.height * 0.55,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                onPageChanged: (index) {
                  setState(() {
                    _curouselIndex = index;
                  });
                },
                items: imgList.map((imgUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (_) {
                              return FullScreenImageView(user: widget.user, currIndex: _curouselIndex,);
                            }
                          ));
                        },
                        child: Container(
                          child: Image(
                            image: AssetImage(imgUrl),
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            Container(
              // height: 200.0,
              padding: EdgeInsets.only(
                  top: 15.0, bottom: 30.0, left: 15.0, right: 15.0),
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).backgroundColor,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            StringUtils.capitalize(widget.user.name),
                            style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'SourceSansProBold',
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                widget.user.age,
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
                                widget.user.gender,
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
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                decoration: ShapeDecoration(
                                    shape: CircleBorder(),
                                    color: Theme.of(context).accentColor,
                                    shadows: [
                                      BoxShadow(
                                        blurRadius: 1.5,
                                        spreadRadius: 1.5,
                                        color: Color(0xff3f72af),
                                      ),
                                    ]),
                                child: IconButton(
                                  icon: Icon(Icons.chat_bubble),
                                  iconSize: 25.0,
                                  color: Color(0xff3f72af),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Container(
                                decoration: ShapeDecoration(
                                    shape: CircleBorder(),
                                    color: Theme.of(context).accentColor,
                                    shadows: [
                                      BoxShadow(
                                        blurRadius: 1.5,
                                        spreadRadius: 1.5,
                                        color: Color(0xff3f72af),
                                      ),
                                    ]),
                                child: IconButton(
                                  icon: widget.user.onCall
                                      ? Icon(Icons.phone_in_talk)
                                      : Icon(Icons.phone),
                                  iconSize: 25.0,
                                  color: widget.user.onCall
                                      ? Color(0xff0c3566)
                                      : Color(0xff3f72af),
                                  onPressed: () {
                                    if (!widget.user.onCall) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                CallScreen(user: widget.user)),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'A thin horizontal line May 27, 2018 - Using Center() seems to ignore TextAlign entirely on the Text widget. It will not align TextAlign.left or TextAlign.right if you try, it will remain in theA thin horizontal line May 27, 2018 - Using Center() seems to ignore TextAlign entirely on the Text widget. It will not align TextAlign.left or TextAlign.right if you try, it will remain in the A thin horizontal line May 27, 2018 - Using Center() seems to ignore TextAlign entirely on the Text widget. It will not align TextAlign.left or TextAlign.right if you try, it will remain in the',
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 18.0,
                        fontFamily: 'SourceSansProRegular',
                      ),
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
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
}
