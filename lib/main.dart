import 'package:SchoolManagementApplication/Batch.dart';
import 'package:SchoolManagementApplication/Calendar.dart';
import 'package:SchoolManagementApplication/Splash_Screen.dart';
//import 'package:SchoolManagementApplication/Splash_Screen.dart';
import 'package:SchoolManagementApplication/Users.dart';
import 'package:SchoolManagementApplication/student.dart';
import 'package:SchoolManagementApplication/Fee_Collection.dart';
import 'package:flutter/material.dart';

//import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => MeroSplashScreen(),
      '/home': (context) => School(),
      '/stmgmt': (context) => StudentManagement(),
      '/fee': (context) => FeeCollection(),
      '/users': (context) => Users(),
      '/batchs': (context) => Batch(),
    },
  ));
}

class School extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Wellcome to School"),
        ),
        drawer: Drawer(
            child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.supervised_user_circle),
              onTap: () {
                Navigator.pushNamed(context, "/users");
              },
            ),
            ListTile(
                leading: Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.deepPurple,
                ),
                title: Text("Calendar"),
                onTap: () {
                  Navigator.pushReplacement(context,
                      new MaterialPageRoute(builder: (context) => Calendar()));
                }),
          ],
        )),
        body: Container(
          padding: EdgeInsets.all(8),
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(3.0),
            children: [
              makeDashboard("Students", Icons.group, context),
              makeDashboard("Fee Collection", Icons.money, context),
              makeDashboard("Mark Analysis", Icons.mark_as_unread, context),
              makeDashboard("Attedence", Icons.calendar_today, context),
              makeDashboard("SMS", Icons.sms, context),
              makeDashboard(
                  "Transportation", Icons.emoji_transportation, context),
            ],
          ),
        ));
  }
}

Widget makeDashboard(String title, IconData icon, BuildContext context) {
  return Card(
    elevation: 16.0,
    margin: EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: () {
        if (title == "Students") {
          Navigator.pushNamed(context, "/stmgmt");
        }

        //else if (title == "Fee Collection") {
        //Navigator.pushReplacement(context,
        //  new MaterialPageRoute(builder: (Context) => Fee_Collection()));

        if (title == "Fee Collection") {
          Navigator.pushNamed(context, "/fee");
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            SizedBox(
              height: 40.0,
            ),
            Center(
              child: Icon(icon, size: 40.0, color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 18, color: Colors.white70),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
