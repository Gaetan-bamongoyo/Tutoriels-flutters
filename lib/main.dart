import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:football_teams/pages/ui_home.dart';
import 'package:football_teams/pages/ui_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Ui_login(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String finalEmail;
  @override
  void initState() {
    super.initState();
    getValidation();
    Timer(
        Duration(seconds: 5),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Ui_principale())));
  }

  Future getValidation() async {
    SharedPreferences init = await SharedPreferences.getInstance();
    var obtenir = init.getString("username");
    setState(() {
      finalEmail = obtenir;
    });
    print(finalEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/apr_fc.jpg',
            height: 200.0,
          ),
          SizedBox(
            height: 30,
          ),
          SpinKitRipple(
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
