import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const Challenge3());
}

enum DiceSide { left, right }

class Challenge3 extends StatefulWidget {
  const Challenge3({Key? key}) : super(key: key);

  @override
  State<Challenge3> createState() => _Challenge3State();
}

class _Challenge3State extends State<Challenge3> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 2;

  @override
  Widget build(BuildContext context) {
    void randomizeDice(DiceSide side) {
      setState(() {
        if (side == DiceSide.left) {
          leftDiceNumber = Random().nextInt(5) + 1;
          rightDiceNumber = 6 - leftDiceNumber;
        } else {
          rightDiceNumber = Random().nextInt(5) + 1;
          leftDiceNumber = 6 - rightDiceNumber;
        }
      });
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text("Dicee"),
          backgroundColor: Colors.red,
        ),
        body: SafeArea(
          child: Center(
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () {
                        randomizeDice(DiceSide.left);
                      },
                      child: Image.asset("assets/images/dice$leftDiceNumber.png")),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () {
                        randomizeDice(DiceSide.right);
                      },
                      child: Image.asset("assets/images/dice$rightDiceNumber.png")),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
