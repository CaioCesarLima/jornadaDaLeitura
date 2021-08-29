import 'package:flutter/material.dart';

class CreateUserPage extends StatefulWidget {
  final String title;
  const CreateUserPage({Key key, this.title = "CreateUserPage"}) : super(key: key);
  @override
  CreateUserPageState createState() => CreateUserPageState();
}
class CreateUserPageState extends State<CreateUserPage> {
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