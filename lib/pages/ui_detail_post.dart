import 'package:flutter/material.dart';
import 'package:football_teams/pages/ui_home.dart';

class Ui_detail_post extends StatefulWidget {
  List detail;
  int index;
  Ui_detail_post({@required this.detail, @required this.index});

  @override
  _Ui_detail_postState createState() => _Ui_detail_postState();
}

class _Ui_detail_postState extends State<Ui_detail_post> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6E6E6),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 550,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12))),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 495,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(12)),
                        image: DecorationImage(
                            image: NetworkImage(
                                "http://192.168.43.248/team/fichier/${widget.detail[widget.index]['photo_bloq']}"),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(icon: Icon(Icons.share), onPressed: () {}),
                      SizedBox(
                        width: 200,
                      ),
                      IconButton(icon: Icon(Icons.comment), onPressed: () {}),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12, left: 10),
            child: Text(widget.detail[widget.index]['description']),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.backspace),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Ui_principale()));
                  }),
              SizedBox(
                width: 10,
              ),
              IconButton(
                icon: Icon(Icons.notifications_active),
                onPressed: () {},
                color: Colors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
