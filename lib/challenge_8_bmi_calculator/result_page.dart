import 'package:flutter/material.dart';
import 'package:udemy_flutter_bootcamp/challenge_8_bmi_calculator/constant.dart';
import 'package:udemy_flutter_bootcamp/challenge_8_bmi_calculator/input_page.dart';
import 'package:udemy_flutter_bootcamp/challenge_8_bmi_calculator/result_brain.dart';

void main() => runApp(ResultsPage(Gender.MALE, 167, 120, 24));

class ResultsPage extends StatelessWidget {
  ResultsPage(this.gender, this.height, this.weight, this.age) {
    resultBrain = ResultBrain(gender: gender, height: height, weight: weight, age: age);
  }

  late ResultBrain resultBrain;

  final Gender gender;
  final int height;
  final int weight;
  final int age;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0x0FF0A0E21),
          appBarTheme: AppBarTheme(backgroundColor: Color(0xFF0A0E21))),
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                /// title your result
                Text(
                  "YOUR RESULT",
                  style: kStyleTextLabel.copyWith(
                      fontSize: 40, color: Colors.white),
                ),

                /// result box
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: kColorCardActive,
                        borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(resultBrain.getStatusResult(),style: TextStyle(
                          fontSize: 24,
                          color: resultBrain.getStatusColor()
                        ),),
                        Text(
                          resultBrain.calculateBmi().toString(),
                          style: kStyleTextNumber.copyWith(fontSize: 80),
                        ),
                        Text(
                          resultBrain.getDescResult(),
                          style: kStyleTextLabel,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),

                /// btn calculate
                Container(
                  height: 80,
                  child: Card(
                    cardColor: Colors.red,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Center(
                        child: Text(
                      "Re-Calculate",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: 2),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    this.child,
    this.cardColor,
    this.onTap,
  });

  final Widget? child;
  final Color? cardColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: child,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: cardColor ?? const Color(0xFF1D1E33),
            borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
