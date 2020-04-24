import 'package:flutter/material.dart';
import 'package:new_app/models/message_model.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
          'Edit Profile',
          style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'sourceSansProBold',
              color: Colors.white),
        ),
        elevation: 0.9,
      ),
      body: SingleChildScrollView(
              child: Container(
          padding: EdgeInsets.all(20.0),
          height: MediaQuery.of(context).size.height,
          color: Theme.of(context).backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Add Images',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'SourceSansProSemiBold',
                    fontSize: 18.0),
              ),
              SizedBox(
                height: 15.0,
              ),
              Wrap(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.14,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          
                        ),
                        child: IconButton(
                          icon: Icon(Icons.add_a_photo),
                          iconSize: 25.0,
                          color: Theme.of(context).primaryColor,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Name',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'SourceSansProSemiBold',
                    fontSize: 18.0),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: TextFormField(
                initialValue: currentUser.name,
                // decoration: InputDecoration(
                  
                // ),
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
