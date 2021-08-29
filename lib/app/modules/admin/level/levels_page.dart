import 'package:flutter/material.dart';

class LevelsPage extends StatefulWidget {
  final String title;
  const LevelsPage({Key key, this.title = "LevelsPage"}) : super(key: key);
  @override
  LevelsPageState createState() => LevelsPageState();
}
class LevelsPageState extends State<LevelsPage> {
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