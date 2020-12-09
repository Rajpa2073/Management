import 'package:flutter/material.dart';

class Batch extends StatefulWidget {
  @override
  _BatchState createState() => _BatchState();
}

class _BatchState extends State<Batch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Batch Setup"),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Enter Batch Number',
                  hintStyle: TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hoverColor: Colors.red,
                  filled: true,
                  // fillColor: Colors.lightBlue,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
          ],
        ));
  }
}
