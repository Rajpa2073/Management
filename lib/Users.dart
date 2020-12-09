import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:convert";

class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  bool isLoading = true; //loading fisrt after but not back
  List listUser;
  Future<String> getUsers() async {
    var response = await http.get(
        "http://192.168.100.143/School_Management/get_users.php"); //gettting data from database

    var getdata = json.decode(response.body);
    if (this.mounted) {
      setState(() {
        isLoading = false;
        listUser = getdata;
        print(listUser);
      });
    }
  }

  Widget listItem(int i) {
    return Center(
        child: listUser == null
            ? CircularProgressIndicator()
            : Column(
                children: [
                  Card(
                    child: Text(listUser[i]["u_fullname"]),
                  )
                ],
              ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  isLoading = true; //
                  getUsers();
                });
              })
        ],
      ),
      body: ListView(
        children: [
          (isLoading)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listUser == null ? 0 : listUser.length,
                  itemBuilder: (context, i) {
                    return listItem(i);
                  },
                )
        ],
      ),
    );
  }
}
