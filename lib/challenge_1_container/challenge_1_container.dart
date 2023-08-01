import 'package:flutter/material.dart';

void main() {
  runApp(const Challenge1());
}

class Challenge1 extends StatelessWidget {
  const Challenge1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Challenge 1"),
          backgroundColor: Colors.teal,
        ),
        backgroundColor: Colors.teal,
        body: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100,
                color: Colors.red,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.yellow,
              ),
              Container(
                width: 100,
                color: Colors.blueAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
