import 'package:flutter/material.dart';
import 'package:udemy_flutter_bootcamp/challenge_7_destini/story_brain.dart';

StoryBrain storyBrain = StoryBrain();

void main() {
  runApp(MaterialApp(
    home: Destini(),
  ));
}

class Destini extends StatefulWidget {
  const Destini({Key? key}) : super(key: key);

  @override
  State<Destini> createState() => _DestiniState();
}

class _DestiniState extends State<Destini> {

  void nextStory(int choiceNumber) {
    setState(() {
      storyBrain.nextStory(choiceNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg_destini.png"),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            /// story texts
            Expanded(
                flex: 6,
                child: Center(
                    child: Text(
                  storyBrain.getStory(),
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ))),

            /// choice 1
            Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  color: Colors.red,
                  child: TextButton(
                    onPressed: () {
                      nextStory(1);
                    },
                    child: Text(
                      storyBrain.getChoice1(),
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                )),
            SizedBox(
              height: 16,
            ),

            /// choice 2
            Visibility(
              child: Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    color: Colors.blue,
                    child: TextButton(
                      onPressed: () {
                        nextStory(2);
                      },
                      child: Text(
                        storyBrain.getChoice2(),
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  )),
              visible: storyBrain.buttonShouldBeVisible(),
            )
          ],
        ),
      ),
    );
  }
}
