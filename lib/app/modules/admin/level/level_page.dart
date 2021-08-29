import 'package:flutter/material.dart';

class LevelPage extends StatefulWidget {
  final String title;
  const LevelPage({Key key, this.title = "LevelPage"}) : super(key: key);
  @override
  LevelPageState createState() => LevelPageState();
}
class LevelPageState extends State<LevelPage> {
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