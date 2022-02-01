import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:football_teams/colors/colors.dart';

class Ui_score extends StatefulWidget {
  //const Ui_score({ Key? key }) : super(key: key);

  @override
  _Ui_scoreState createState() => _Ui_scoreState();
}

class _Ui_scoreState extends State<Ui_score> {
  Future listMatch() async {
    var url = 'http://192.168.43.248/team/getAllMatch.php';
    var response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar(),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Column(
            children: <Widget>[
              Container(height: 10, child: getRow()),
              Expanded(child: getMatch())
            ],
          )),
        ],
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
          icon: (Icon(Icons.keyboard_return)),
          color: Colors.black,
          onPressed: () {}),
      title: Text(
        "Match prevision",
        style: TextStyle(color: Colors.black),
      ),
      actions: <Widget>[
        IconButton(
            icon: (Icon(Icons.more)), color: Colors.black, onPressed: () {})
      ],
    );
  }

  Widget getRow() {
    return Container(
      height: 20,
      color: Colors.white,
    );
  }

  Widget getMatch() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.black,
        child: FutureBuilder(
            future: listMatch(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        List vu = snapshot.data;
                        return Container(
                          //color: Colors.black,
                          margin: EdgeInsets.symmetric(vertical: 12.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                vu[index]['designation'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: Text(
                                    vu[index]['goal'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  )),
                                  Expanded(
                                    child: Text(
                                      vu[index]['name'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                  // Image.network(
                                  //   "http://192.168.43.230/team/fichier/${vu[index]['	logo_visiteur']}",
                                  //   width: 36.0,
                                  // ),
                                  Expanded(
                                    child: Text(
                                      vu[index]['goal'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                  // Image.network(
                                  //   match.away.logoUrl,
                                  //   width: 36.0,
                                  // ),
                                  Expanded(
                                    child: Text(
                                      vu[index]['name'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      })
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            }),
      ),
    );
  }

  Widget getBody() {
    return FutureBuilder(
      future: listMatch(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  List match = snapshot.data;
                  return Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 100,
                          color: Colors.white,
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    match[index]['designation'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  IconButton(
                                      icon: Icon(Icons.table_chart),
                                      onPressed: () {})
                                ],
                              ),
                              Container(
                                height: 50,
                                color: kTextLightColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Column(
                                      children: <Widget>[
                                        Center(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Text(
                                                match[index]['name_domicile'],
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              // Image.network(
                                              //   "http://192.168.43.230/team/fichier/${match[index]['logo_domicile']}",
                                              //   height: 30,
                                              //   width: 30,
                                              //   fit: BoxFit.cover,
                                              // ),
                                              Text(
                                                match[index]['goal'],
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              // Container(
                                              //   padding: EdgeInsets.only(
                                              //       left: 5, right: 5),
                                              //   child: Image.network(
                                              //     "http://192.168.43.230/team/fichier/${match[index]['logo_visiteur']}",
                                              //     height: 30,
                                              //     width: 30,
                                              //     fit: BoxFit.cover,
                                              //   ),
                                              // ),
                                              Text(
                                                match[index]['name'],
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                })
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
