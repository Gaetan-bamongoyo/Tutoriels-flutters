import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:football_teams/colors/colors.dart';
import 'package:football_teams/pages/ui_detail_player.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Ui_players extends StatefulWidget {
  //const Ui_players({ Key? key }) : super(key: key);

  @override
  _Ui_playersState createState() => _Ui_playersState();
}

class _Ui_playersState extends State<Ui_players> {
  Future listDefenseur() async {
    var url = 'http://192.168.43.248/team/getDefenseur.php';
    var response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Teams players"),
          leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Ui_principale()));
              }),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.note), onPressed: () {})
          ],
          backgroundColor: Colors.black,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft),
            ),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(Icons.score),
                text: "Man",
              ),
              Tab(
                icon: Icon(Icons.score),
                text: "Women",
              ),
              Tab(
                icon: Icon(Icons.score),
                text: "Under 23",
              ),
            ],
          ),
        ),
        body: TabBarView(children: [card(), card(), card()]),
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => HomePagePost()));
          }),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: null,
          color: Colors.white,
        ),
        IconButton(
          icon: Icon(Icons.card_giftcard),
          onPressed: null,
          color: Colors.white,
        ),
        SizedBox(
          width: kDefaultPaddin / 2,
        ),
      ],
    );
  }

  Widget card() {
    return FutureBuilder(
        future: listDefenseur(),
        builder: (context, snap) {
          if (snap.hasError) print(snap.error);
          return snap.hasData
              ? StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: snap.data.length,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Ui_detail_player(
                                        players: snap.data,
                                        index: index,
                                      )));
                        },
                        child: Stack(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.bottomLeft,
                              height: 240,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "http://192.168.43.248/team/fichier/${snap.data[index]['photo']}"),
                                    fit: BoxFit.cover),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      snap.data[index]['dorsale'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      snap.data[index]['nom_personne'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomLeft,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: LinearGradient(
                                      end: Alignment.bottomCenter,
                                      begin: Alignment.topCenter,
                                      colors: [
                                        Colors.black.withAlpha(0),
                                        Colors.black.withAlpha(0),
                                        Colors.black.withAlpha(0),
                                        Colors.black12,
                                        Colors.black54,
                                      ])),
                            )
                          ],
                        ),
                      ),
                  // ClipRRect(
                  //       borderRadius: BorderRadius.circular(16.0),
                  //       child: Image.network(
                  //           "http://192.168.43.230/team/fichier/${snap.data[index]['photo']}",
                  //           fit: BoxFit.cover),
                  //     ),
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                )
              : Center();
        });
  }

  Widget getAttaquant() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
          future: listDefenseur(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: snapshot.hasData
                  ? GridView.builder(
                      itemCount: snapshot.data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: kDefaultPaddin,
                          crossAxisSpacing: kDefaultPaddin,
                          childAspectRatio: 0.75),
                      itemBuilder: (context, index) {
                        List defend = snapshot.data;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Ui_detail_player(
                                                  players: defend,
                                                  index: index,
                                                )));
                                  },
                                  child: Image(
                                    image: NetworkImage(
                                        "http://192.168.43.230/team/fichier/${defend[index]['photo']}"),
                                    fit: BoxFit.cover,
                                    height: 100,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: kDefaultPaddin / 2),
                              child: Text(
                                "Nom du joueur  ${defend[index]['nom_personne']}",
                                style: TextStyle(color: kTextLightColor),
                              ),
                            ),
                            Text(
                              " Dorsale  ${defend[index]['dorsale']}",
                              style: TextStyle(color: kTextLightColor),
                            )
                          ],
                        );
                      })
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            );
          }),
    );
  }
}
