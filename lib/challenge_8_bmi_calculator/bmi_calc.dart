import 'package:flutter/material.dart';
import 'package:udemy_flutter_bootcamp/challenge_7_destini/story_brain.dart';

import 'input_page.dart';

StoryBrain storyBrain = StoryBrain();

void main() => runApp(BMICalc());

class BMICalc extends StatelessWidget {
  const BMICalc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0x0FF0A0E21),
          appBarTheme: AppBarTheme(backgroundColor: Color(0xFF0A0E21))),
      home: InputPage(),
    );
  }
}
