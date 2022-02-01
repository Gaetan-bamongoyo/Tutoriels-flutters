import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Ui_match_all extends StatefulWidget {
  //const Ui_match_all({ Key? key }) : super(key: key);

  @override
  _Ui_match_allState createState() => _Ui_match_allState();
}

class _Ui_match_allState extends State<Ui_match_all> {
  Future listMatch() async {
    var url = 'http://192.168.43.248/team/getAllMatch.php';
    var response = await http.get(url);
    return json.decode(response.body);
  }

  Future listNext() async {
    var url = 'http://192.168.43.248/team/getNextMatch.php';
    var response = await http.get(url);
    return json.decode(response.body);
  }

  Future listToday() async {
    var url = 'http://192.168.43.248/team/getMatchDay.php';
    var response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xFFE6E6E6),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "SCORE",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          elevation: 0.0,
          centerTitle: true,
          leading: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.calendar_today,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white, Colors.white],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft),
            ),
          ),
          bottom: TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            tabs: [
              Tab(
                icon: Icon(Icons.score),
                text: "Next Match",
              ),
              Tab(
                icon: Icon(Icons.score),
                text: "Pass Match",
              ),
              Tab(
                icon: Icon(Icons.score),
                text: "Match of the day",
              ),
            ],
          ),
        ),
        body: TabBarView(children: [getMatchNext(), getMatchPass(), getBody()]),
      ),
    );
  }

  Widget getMatchPass() {
    return FutureBuilder(
        future: listMatch(),
        builder: (context, snaphot) {
          if (snaphot.hasError) print(snaphot.error);
          return snaphot.hasData
              ? ListView.builder(
                  itemCount: snaphot.data.length,
                  itemBuilder: (context, index) {
                    List next = snaphot.data;
                    return Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Color(0xFFE6E6E6),
                          //height: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/apr_fc.jpg",
                                    width: 30,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            next[index]['designation'],
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Rwanda",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            next[index]['date_match'],
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 75,
                                width: 500,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(right: 2, left: 1),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        next[index]['heure'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Image.network(
                                                  "http://192.168.43.248/team/fichier/${next[index]['logo_domicile']}",
                                                  width: 18,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(next[index]
                                                    ['name_domicile']),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Image.network(
                                                  "http://192.168.43.248/team/fichier/${next[index]['logo_visiteur']}",
                                                  width: 18,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(next[index]['name']),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(next[index]['goal_away']),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(next[index]
                                                    ['goal_visitor']),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                          icon: Icon(Icons.notifications),
                                          onPressed: () {})
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })
              : Center(child: CircularProgressIndicator());
        });
  }

  Widget getBody() {
    return FutureBuilder(
        future: listToday(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    List today = snapshot.data;
                    return SingleChildScrollView(
                      child: Container(
                        color: Colors.black,
                        height: 800,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 550,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white12,
                                  image: new DecorationImage(
                                    image: new AssetImage("assets/statuim.jpg"),
                                    fit: BoxFit.cover,
                                  )),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 20, top: 200),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Match",
                                                style: TextStyle(
                                                  color: Colors.amber,
                                                  fontSize: 50,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "of the day",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 50,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 30, top: 45),
                                          child: Container(
                                            padding: EdgeInsets.all(8.0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(13.0),
                                              color: Colors.white12,
                                            ),
                                            child: Icon(
                                              Icons.notification_important,
                                              color: Colors.white12,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                      ])),
                                  Container(
                                    margin: EdgeInsets.only(top: 55),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          child: Column(
                                            children: [
                                              Image.network(
                                                "http://192.168.43.248/team/fichier/${today[index]['logo_domicile']}",
                                                height: 110,
                                                width: 110,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                today[index]['name_domicile'],
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              // Image.network(
                                              //   "",
                                              //   height: 45,
                                              //   width: 85,
                                              // ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                today[index]['heure'],
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "Rwanda",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black38,
                                                  fontSize: 17,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              Image.network(
                                                "http://192.168.43.248/team/fichier/${today[index]['logo_visiteur']}",
                                                height: 110,
                                                width: 110,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                today[index]['name'],
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              height: 85,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(17.0),
                                      child: Container(
                                        padding: EdgeInsets.all(12.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(13.0),
                                          color: Colors.black87,
                                        ),
                                        child: Icon(
                                          Icons.notifications,
                                          color: Colors.white,
                                          size: 27,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 22),
                                          child: Text(
                                            "What is your prediction  ",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "${today[index]['heure']} | Be connect    ",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 17),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }

  Widget getMatchNext() {
    return FutureBuilder(
        future: listNext(),
        builder: (context, snaphot) {
          if (snaphot.hasError) print(snaphot.error);
          return snaphot.hasData
              ? ListView.builder(
                  itemCount: snaphot.data.length,
                  itemBuilder: (context, index) {
                    List next = snaphot.data;
                    return Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Color(0xFFE6E6E6),
                          //height: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/apr_fc.jpg",
                                    width: 30,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            next[index]['designation'],
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Rwanda",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            next[index]['date_match'],
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 75,
                                width: 500,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, right: 5),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        next[index]['heure'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Image.network(
                                                  "http://192.168.43.248/team/fichier/${next[index]['logo_domicile']}",
                                                  width: 18,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(next[index]
                                                    ['name_domicile']),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Image.network(
                                                  "http://192.168.43.248/team/fichier/${next[index]['logo_visiteur']}",
                                                  width: 18,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(next[index]['name']),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 40,
                                      ),
                                      // Padding(
                                      //   padding: const EdgeInsets.all(8.0),
                                      //   child: Column(
                                      //     children: <Widget>[
                                      //       Row(
                                      //         children: <Widget>[
                                      //           SizedBox(
                                      //             width: 10,
                                      //           ),
                                      //           Text("1"),
                                      //         ],
                                      //       ),
                                      //       SizedBox(
                                      //         height: 10,
                                      //       ),
                                      //       Row(
                                      //         children: <Widget>[
                                      //           SizedBox(
                                      //             width: 10,
                                      //           ),
                                      //           Text("0"),
                                      //         ],
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                      IconButton(
                                          icon: Icon(Icons.notifications),
                                          onPressed: () {})
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })
              : Center(child: CircularProgressIndicator());
        });
  }
}
