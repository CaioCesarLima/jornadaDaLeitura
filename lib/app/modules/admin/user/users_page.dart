import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  final String title;
  const UsersPage({Key key, this.title = "UsersPage"}) : super(key: key);
  @override
  UsersPageState createState() => UsersPageState();
}
class UsersPageState extends State<UsersPage> {
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