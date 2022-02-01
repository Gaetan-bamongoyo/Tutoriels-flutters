// import 'dart:convert';
// import 'package:flutter/src/widgets/basic.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:football_teams/main.dart';
// import 'package:football_teams/pages/ui_all_match.dart';
// import 'package:football_teams/pages/ui_players.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:football_teams/colors/colors.dart';

// class Ui_principale extends StatefulWidget {
//   //const Ui_principale({ Key? key }) : super(key: key);

//   @override
//   _Ui_principaleState createState() => _Ui_principaleState();
// }

// class _Ui_principaleState extends State<Ui_principale> {
//   Future listStories() async {
//     var url = 'http://192.168.43.230/team/stories.php';
//     var response = await http.get(url);
//     return json.decode(response.body);
//   }

//   Future listPosts() async {
//     var post = 'http://192.168.43.230/team/bloq_get.php';
//     var response = await http.get(post);
//     return json.decode(response.body);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: appBar(),
//         body: Column(
//           children: <Widget>[
//             Container(
//               height: 150,
//               child: getStories(),
//             ),
//             Expanded(
//               child: getPosts(),
//             )
//           ],
//         ));
//   }

//   Widget appBar() {
//     return AppBar(
//       title: Text("APR FC $finalEmail"),
//       backgroundColor: Colors.black,
//       elevation: 4.0,
//       actions: <Widget>[
//         IconButton(
//             icon: Icon(Icons.card_giftcard),
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => Ui_players()));
//             }),
//         IconButton(icon: Icon(Icons.person), onPressed: () {}),
//       ],
//       leading: IconButton(
//           icon: Icon(Icons.calendar_today),
//           onPressed: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => Ui_all_match()));
//           }),
//     );
//   }

//   Widget getStories() {
//     return Container(
//       child: FutureBuilder(
//           future: listStories(),
//           builder: (context, snapshot) {
//             if (snapshot.hasError) print(snapshot.error);
//             return snapshot.hasData
//                 ? ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: snapshot.data.length,
//                     itemBuilder: (context, index) {
//                       List storie = snapshot.data;
//                       return Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(3.0),
//                             child: Container(
//                               width: 100,
//                               child: Column(
//                                 children: [
//                                   Stack(
//                                     children: [
//                                       Container(
//                                         decoration: BoxDecoration(
//                                             shape: BoxShape.rectangle,
//                                             gradient:
//                                                 LinearGradient(colors: stories),
//                                             borderRadius:
//                                                 BorderRadius.circular(10)),
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Container(
//                                             height: 100,
//                                             width: 100,
//                                             decoration: BoxDecoration(
//                                                 shape: BoxShape.rectangle,
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                                 border: Border.all(
//                                                     width: 3.0, color: bgWhite),
//                                                 image: DecorationImage(
//                                                     image: NetworkImage(
//                                                         "http://192.168.43.230/team/fichier/${storie[index]['photo']}"),
//                                                     fit: BoxFit.cover)),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Text(
//                                     storie[index]['addBy'],
//                                     style: TextStyle(fontSize: 15),
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           )
//                         ],
//                       );
//                     })
//                 : Center(
//                     child: CircularProgressIndicator(),
//                   );
//           }),
//     );
//   }

//   Widget getPosts() {
//     return Container(
//       child: FutureBuilder(
//           future: listPosts(),
//           builder: (context, snapshot) {
//             if (snapshot.hasError) print(snapshot.error);
//             return snapshot.hasData
//                 ? ListView.builder(
//                     scrollDirection: Axis.vertical,
//                     itemCount: snapshot.data.length,
//                     itemBuilder: (context, index) {
//                       List list = snapshot.data;
//                       return Padding(
//                         padding: const EdgeInsets.only(bottom: 20),
//                         child: Column(
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 15, right: 15, bottom: 15),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Container(
//                                             decoration: BoxDecoration(
//                                                 shape: BoxShape.circle,
//                                                 gradient: LinearGradient(
//                                                     colors: stories)),
//                                             child: Padding(
//                                               padding: const EdgeInsets.all(2),
//                                               child: Container(
//                                                 height: 35,
//                                                 width: 35,
//                                                 decoration: BoxDecoration(
//                                                     shape: BoxShape.circle,
//                                                     border: Border.all(
//                                                         width: 1,
//                                                         color: bgWhite),
//                                                     image: DecorationImage(
//                                                         image: NetworkImage(
//                                                             "http://192.168.43.230/team/fichier/${list[index]['photo_bloq']}"),
//                                                         fit: BoxFit.cover)),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 1,
//                                           ),
//                                           Text(
//                                             list[index]['designation'],
//                                             style: TextStyle(
//                                                 fontWeight: FontWeight.bold),
//                                           )
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   height: 400,
//                                   decoration: BoxDecoration(
//                                       image: DecorationImage(
//                                           image: NetworkImage(
//                                               "http://192.168.43.230/team/fichier/${list[index]['photo_bloq']}"),
//                                           fit: BoxFit.cover)),
//                                 ),
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.only(left: 8, right: 8),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           // IconButton(
//                                           //     icon: SvgPicture.asset(
//                                           //       "assets/images/love_icon",
//                                           //       height: 35,
//                                           //       width: 35,
//                                           //     ),
//                                           //     onPressed: () {}),
//                                           IconButton(
//                                               icon: Icon(Icons.comment),
//                                               onPressed: () {}),
//                                           IconButton(
//                                               icon: Icon(Icons.share),
//                                               onPressed: () {}),
//                                           IconButton(
//                                               icon: Icon(Icons.more),
//                                               onPressed: () {})
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 15, right: 15),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         '',
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       SizedBox(
//                                         height: 2,
//                                       ),
//                                       Text.rich(TextSpan(children: [
//                                         TextSpan(
//                                           text: list[index]['description'],
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                       ])),
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             )
//                           ],
//                         ),
//                       );
//                     })
//                 : Center(
//                     child: CircularProgressIndicator(),
//                   );
//           }),
//     );
//   }
// }
import 'dart:convert';
import 'package:football_teams/main.dart';
import 'package:football_teams/pages/ui_all_match.dart';
import 'package:football_teams/pages/ui_detail_post.dart';
import 'package:football_teams/pages/ui_detail_story.dart';
import 'package:football_teams/pages/ui_match.dart';
import 'package:football_teams/pages/ui_players.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:football_teams/colors/colors.dart';

class Ui_principale extends StatefulWidget {
  //const Ui_principale({ Key? key }) : super(key: key);

  @override
  _Ui_principaleState createState() => _Ui_principaleState();
}

class _Ui_principaleState extends State<Ui_principale> {
  Future listStories() async {
    var url = 'http://192.168.43.248/team/stories.php';
    var response = await http.get(url);
    return json.decode(response.body);
  }

  TrackingScrollController scrollController;

  Future listPosts() async {
    var post = 'http://192.168.43.248/team/bloq_get.php';
    var response = await http.get(post);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Container(
              height: 170,
              child: getStories(),
            ),
            Expanded(
              child: getPosts(),
            )
          ],
        ));

    // return Scaffold(
    //   body: CustomScrollView(
    //     controller: scrollController,
    //     slivers: <Widget>[
    //       SliverAppBar(
    //         brightness: Brightness.light,
    //         backgroundColor: Colors.white,
    //         title: Text(
    //           "APR FC",
    //           style: const TextStyle(
    //             color: Colors.black,
    //             fontSize: 14.0,
    //             fontWeight: FontWeight.bold,
    //             letterSpacing: -1.2,
    //           ),
    //         ),
    //         actions: <Widget>[
    //           IconButton(
    //               icon: Icon(Icons.card_giftcard),
    //               onPressed: () {
    //                 Navigator.push(context,
    //                     MaterialPageRoute(builder: (context) => Ui_players()));
    //               }),
    //           IconButton(icon: Icon(Icons.person), onPressed: () {}),
    //         ],
    //         leading: IconButton(
    //             icon: Icon(Icons.calendar_today),
    //             onPressed: () {
    //               Navigator.push(context,
    //                   MaterialPageRoute(builder: (context) => Ui_all_match()));
    //             }),
    //       ),
    //       SliverToBoxAdapter(
    //         child: Container(),
    //       ),
    //       SliverPadding(
    //         padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
    //         sliver: SliverToBoxAdapter(),
    //       ),
    //       SliverPadding(
    //         padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
    //         sliver: SliverToBoxAdapter(
    //           child: getStories(),
    //         ),
    //       ),
    //       // SliverList(
    //       //   delegate: SliverChildBuilderDelegate(
    //       //     (context, index) {
    //       //       final Post post = posts[index];
    //       //       return PostContainer(post: post);
    //       //     },
    //       //     childCount: posts.length,
    //       //   ),),
    //     ],
    //   ),
    // );
  }

  Widget appBar() {
    return AppBar(
      title: Text("APR FC "),
      backgroundColor: Colors.black,
      elevation: 4.0,
      actions: <Widget>[
        IconButton(icon: Icon(Icons.movie), onPressed: () {}),
        IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Ui_players()));
            }),
      ],
      leading: IconButton(
          icon: Icon(Icons.calendar_today),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Ui_match_all()));
          }),
    );
  }

  Widget getStories() {
    return Container(
      child: FutureBuilder(
          future: listStories(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      List storie = snapshot.data;
                      return Container(
                          child: Padding(
                        padding: const EdgeInsets.all(0.05),
                        child: Container(
                          height: 150,
                          width: 115,
                          decoration: BoxDecoration(
                            gradient: null,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Ui_detail_story(
                                                detail: storie,
                                                index: index,
                                              )));
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          gradient:
                                              LinearGradient(colors: stories),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          height: 150,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  width: 3.0, color: bgWhite),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      "http://192.168.43.248/team/fichier/${storie[index]['photo']}"),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              // Text(
                              //   storie[index]['addBy'],
                              //   style: TextStyle(fontSize: 15),
                              //   maxLines: 1,
                              //   overflow: TextOverflow.ellipsis,
                              // ),
                            ],
                          ),
                        ),
                      ));
                    })
                : Center(
                    child: CircularProgressIndicator(),
                  );
          }),
    );
  }

  Widget getPosts() {
    return Container(
      child: FutureBuilder(
          future: listPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      List list = snapshot.data;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // Padding(
                                //   padding: const EdgeInsets.only(
                                //       left: 15, right: 15, bottom: 15),
                                //   child: Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       Row(
                                //         children: [
                                //           Container(
                                //             decoration: BoxDecoration(
                                //                 shape: BoxShape.circle,
                                //                 gradient: LinearGradient(
                                //                     colors: stories)),
                                //             child: Padding(
                                //               padding: const EdgeInsets.all(2),
                                //               child: Container(
                                //                 height: 35,
                                //                 width: 35,
                                //                 decoration: BoxDecoration(
                                //                     shape: BoxShape.circle,
                                //                     border: Border.all(
                                //                         width: 1,
                                //                         color: bgWhite),
                                //                     image: DecorationImage(
                                //                         image: NetworkImage(
                                //                             "http://192.168.43.248/team/fichier/${list[index]['photo_bloq']}"),
                                //                         fit: BoxFit.cover)),
                                //               ),
                                //             ),
                                //           ),
                                //           SizedBox(
                                //             height: 1,
                                //           ),
                                //           Text(
                                //             list[index]['designation'],
                                //             style: TextStyle(
                                //                 fontWeight: FontWeight.bold),
                                //           )
                                //         ],
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Ui_detail_post(
                                                    detail: list,
                                                    index: index)));
                                  },
                                  child: Container(
                                    height: 400,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "http://192.168.43.248/team/fichier/${list[index]['photo_bloq']}"),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          // IconButton(
                                          //     icon: SvgPicture.asset(
                                          //       "assets/images/love_icon",
                                          //       height: 35,
                                          //       width: 35,
                                          //     ),
                                          //     onPressed: () {}),
                                          IconButton(
                                              icon: Icon(Icons.comment),
                                              onPressed: () {}),
                                          IconButton(
                                              icon: Icon(Icons.share),
                                              onPressed: () {}),
                                          IconButton(
                                              icon: Icon(Icons.more),
                                              onPressed: () {})
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        '',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text.rich(TextSpan(children: [
                                        TextSpan(
                                          text: list[index]['title_bloq'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ])),
                                    ],
                                  ),
                                )
                              ],
                            )
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
