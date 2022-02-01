import 'package:flutter/material.dart';
import 'package:football_teams/main.dart';
import 'package:football_teams/pages/ui_home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Ui_login extends StatefulWidget {
  //const Ui_login({ Key? key }) : super(key: key);

  @override
  _Ui_loginState createState() => _Ui_loginState();
}

class _Ui_loginState extends State<Ui_login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void session() async {
    SharedPreferences user = await SharedPreferences.getInstance();
    user.setString("username", email.text);
  }

  @override
  void initState() {
    super.initState();
    cheklogin();
  }

  void cheklogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var val = pref.getString("username");
    if (val != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    }
  }

  void login() async {
    if (email.text.isNotEmpty || password.text.isNotEmpty) {
      final response = await http.post(
          "http://192.168.43.248/team/username.php",
          body: {"username": email.text, "password": password.text});
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        session();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Ui_principale()));
        print(data);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Je suis fan",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            "Je soutiens mon club",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: email,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.mail,
                  color: Colors.black,
                ),
                hintText: "Enter your mail"),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: password,
            obscureText: true,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
                hintText: "Enter your mail"),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                "Don't have a account ?",
                style: TextStyle(color: Colors.black54, fontSize: 10),
              ),
              SizedBox(
                height: 10,
              ),
              RawMaterialButton(
                onPressed: () {},
                child: Text("Sign up"),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            child: RawMaterialButton(
              fillColor: Colors.grey,
              elevation: 0.0,
              padding: EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              onPressed: () {
                login();
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // Container(
          //   width: double.infinity,
          //   child: RawMaterialButton(
          //     fillColor: Colors.grey,
          //     elevation: 0.0,
          //     padding: EdgeInsets.symmetric(vertical: 20.0),
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(12.0)),
          //     onPressed: () {
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => Ui_principale()));
          //     },
          //     child: Text(
          //       'After',
          //       style: TextStyle(color: Colors.black, fontSize: 18),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
