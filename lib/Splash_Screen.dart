import 'dart:async';

import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'login.dart';

void main() => runApp(MaterialApp(
      theme:
          ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ));

class MeroSplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<MeroSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 10),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => LoginApp())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.blueGrey),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 40.0,
                        child: Image.asset(
                          "img/cap.png",
                          height: 80,
                          width: 80,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "School Management App",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      strokeWidth: 6,
                      backgroundColor: Colors.green,
                      valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      "©RAJPA",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
