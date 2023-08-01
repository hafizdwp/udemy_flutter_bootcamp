import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const Challenge4());
}

class Challenge4 extends StatefulWidget {
  const Challenge4({Key? key}) : super(key: key);

  @override
  State<Challenge4> createState() => _Challenge4State();
}

class _Challenge4State extends State<Challenge4> {

  int ballNumber = 1;

  void randomize() {
    setState(() {
      ballNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: TextButton(
              onPressed: () {
                randomize();
              },
              child: Image.asset("assets/images/ball$ballNumber.png")),
        ),
      ),
    );
  }
}
