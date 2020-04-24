import 'package:new_app/models/user_model.dart';

class Messages {
  final User sender;
  final String time;
  final String text;
  final bool unread;

  Messages({
    this.sender,
    this.time,
    this.text,
    this.unread,
  });
}

final User currentUser = User(id: 1, name: 'tiyasa', imageUrl: ['assets/images/tiyasa.jpg', 'assets/images/tiyasa.jpg'], gender: 'Female', age: '21', online : true, onCall: true, coinValue: 20);


// final User tiyasa = User(id: 1, name: 'tiyasa', imageUrl: ['assets/images/tiyasa.jpg'], gender: 'Female', age: '21', online: true, onCall: true);
final User rike = User(id: 2, name: 'rike', imageUrl: ['assets/images/rike.jpg'], gender: 'Female', age: '19', online: true, onCall: false);
final User sophie = User(id: 3, name: 'sophie', imageUrl: ['assets/images/sophie.jpg'], gender: 'Female', age: '21', online: true, onCall: false);
final User steven = User(id: 1, name: 'steven', imageUrl: ['assets/images/steven.jpg', 'assets/images/3.jpg', 'assets/images/image.jpg'], gender: 'Male', age: '29', online: true, onCall: true);
final User olivia = User(id: 5, name: 'olivia', imageUrl: ['assets/images/3.jpg'], gender: 'Female', age: '22', online: false, onCall: false);
final User will = User(id: 6, name: 'will', imageUrl: ['assets/images/will.jpg'], gender: 'Male', age: '21', online: false, onCall: false);
final User turner = User(id: 7, name: 'turner', imageUrl: ['assets/images/will.jpg'], gender: 'Male', age: '18', online: false, onCall: false);

final String userBio = "Daily inspiration collected from daily ui archive and beyond. Based on ... You can see the designs from the challenge below.";

final List<Messages> chat = [
  // Messages(
  //   sender: tiyasa,
  //   time: '5:30 PM',
  //   text: 'Hey,',
  //   unread: true,
  // ),
  Messages(
    sender: rike,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: true,
  ),
  Messages(
    sender: sophie,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: false,
  ),
  Messages(
    sender: steven,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: false,
  ),
  Messages(
    sender: olivia,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: false,
  ),
  Messages(
    sender: will,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: false,
  ),
   Messages(
    sender: turner,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: false,
  ),
];