import 'package:flutter/material.dart';

class Ui_detail_story extends StatefulWidget {
  List detail;
  int index;
  Ui_detail_story({@required this.detail, @required this.index});

  @override
  _Ui_detail_storyState createState() => _Ui_detail_storyState();
}

class _Ui_detail_storyState extends State<Ui_detail_story> {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      "http://192.168.43.248/team/fichier/${widget.detail[widget.index]['photo']}",
      fit: BoxFit.cover,
    );
  }
}
