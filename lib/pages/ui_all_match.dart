import 'dart:convert';
import 'package:football_teams/pages/ui_home.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Ui_all_match extends StatefulWidget {
  //const Ui_all_match({ Key? key }) : super(key: key);

  @override
  _Ui_all_matchState createState() => _Ui_all_matchState();
}

class _Ui_all_matchState extends State<Ui_all_match> {
  Future listMatch() async {
    var url = 'http://192.168.43.230/team/getAllMatch.php';
    var response = await http.get(url);
    return json.decode(response.body);
  }

  Future listToday() async {
    var url = 'http://192.168.43.230/team/getMatchDay.php';
    var response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("All Score Match"),
          leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Ui_principale()));
              }),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.note), onPressed: () {})
          ],
          backgroundColor: Colors.black,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.white],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft),
            ),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(Icons.score),
                text: "All Match",
              ),
              Tab(
                icon: Icon(Icons.score),
                text: "Match of the day",
              ),
            ],
          ),
        ),
        body: TabBarView(children: [getMatch(), getBody()]),
      ),
    );
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
                                    image: new AssetImage("assets/Statuim.jpg"),
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
                                                "http://192.168.43.230/team/fichier/${today[index]['logo_domicile']}",
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
                                                today[index]['goal'],
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
                                                "http://192.168.43.230/team/fichier/${today[index]['logo_visiteur']}",
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
                                          "${today[index]['goal']} | Be connect    ",
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

  Widget getMatch() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                        color: Colors.black,
                        height: 90,
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
                            Text(
                              vu[index]['date_match'],
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
                                    vu[index]['name_domicile'],
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
    );
  }
}

class Choice {
  final String title;
  final IconData icon;
  const Choice({this.title, this.icon});
}

const List<Choice> choices = <Choice>[
  Choice(title: 'All Match', icon: Icons.score),
  Choice(title: 'Match of the day', icon: Icons.score)
];

class ChoicePage extends StatelessWidget {
  const ChoicePage({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              choice.icon,
              size: 150.0,
              color: textStyle.color,
            ),
            Text(
              choice.title,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
