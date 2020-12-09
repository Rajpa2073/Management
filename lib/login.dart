import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginApp(),
  ));
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: (Colors.blue),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// CircleAvatar(
            ///child: Image.asset(
            ///"img/1.jpg",
            /// height: 100,
            ///),
            // ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Material(
                elevation: 50,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.white70,
                //color: Colors.blueAccent,
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Colors.deepPurple,
                    ),
                    hintText: "User Name",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Material(
                elevation: 50,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.white70,
                //color: Colors.blueAccent,
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock,
                      color: Colors.deepPurple,
                    ),
                    hintText: "Password",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Container(
              height: 65,
              width: 320,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/home");
                  },
                  color: Colors.deepPurple,
                  textColor: Colors.white70,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  //splashColor: Colors.deepPurpleAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
