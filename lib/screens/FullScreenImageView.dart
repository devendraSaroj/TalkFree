import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:new_app/models/user_model.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class FullScreenImageView extends StatefulWidget {
  final User user;
  final currIndex;
  final length;

  FullScreenImageView({
    this.user,
    this.currIndex,
    this.length,
  });

  @override
  _FullScreenImageViewState createState() => _FullScreenImageViewState();
}

class _FullScreenImageViewState extends State<FullScreenImageView> {
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
      body: SafeArea(
              child: Container(
          color: Theme.of(context).backgroundColor,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              PhotoViewGallery.builder(
            builder: (BuildContext context, int index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: AssetImage(imgList[index]),
                heroAttributes: PhotoViewHeroAttributes(tag: index),
                minScale: PhotoViewComputedScale.contained,
              );
            },
            itemCount: widget.length == null ? imgList.length : widget.length,
            loadingChild: Text(
              'Loading...',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18.0,
                  fontFamily: 'SourceSansProRegular'),
            ),
          ),
          Positioned(
            right: 10.0,
            top: 5.0,
            child: IconButton(
            icon: Icon(Icons.close),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ),
            ],
          ),
        ),
      ),
    );
  }
}
