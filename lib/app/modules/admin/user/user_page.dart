import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  final String title;
  const UserPage({Key key, this.title = "UserPage"}) : super(key: key);
  @override
  UserPageState createState() => UserPageState();
}
class UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}