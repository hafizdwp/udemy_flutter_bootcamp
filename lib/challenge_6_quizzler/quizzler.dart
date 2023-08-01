import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:udemy_flutter_bootcamp/challenge_6_quizzler/quiz_brain.dart';

void main() {
  runApp(MaterialApp(
    home: Quizzler(),
  ));
}

QuizBrain quizBrain = QuizBrain();

class Quizzler extends StatefulWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  void setAnswer(bool answer) {
    setState(() {
      quizBrain.answer(answer);
      bool nextQuestion = quizBrain.nextQuestion();

      if (!nextQuestion) {
        Alert(
            context: context,
            title: "Finished",
            desc: "You've reached the end of the quiz!",
            style: AlertStyle(isOverlayTapDismiss: false, isCloseButton: false),
            buttons: [
              DialogButton(
                  child: Text(
                    "OK",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      quizBrain.reset();
                    });
                  })
            ]).show();
      }
    });
  }

  List<Widget> parseScoreLayout() {
    List<Widget> layout = [];
    List<bool> scores = quizBrain.getScores();
    for (bool score in scores) {
      if (score) {
        layout.add(
          const Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        layout.add(const Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
    }

    return layout;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// question
            Expanded(
                flex: 4,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(quizBrain.getLatestQuestion(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ),
                )),

            /// btn TRUE
            Expanded(
              child: TextButton(
                  onPressed: () {
                    setAnswer(true);
                  },
                  child: Container(
                      color: Colors.green,
                      width: double.infinity,
                      height: 70,
                      child: const Center(
                          child: Text(
                        "TRUE",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )))),
            ),

            /// btn FALSE
            Expanded(
              child: TextButton(
                onPressed: () {
                  setAnswer(false);
                },
                child: Container(
                  color: Colors.red,
                  width: double.infinity,
                  height: 70,
                  child: const Center(
                      child: Text("FALSE",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                ),
              ),
            ),

            /// score checks
            Row(children: parseScoreLayout())
          ],
        ),
      ),
    );
  }
}
