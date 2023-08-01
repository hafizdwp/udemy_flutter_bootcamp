import 'package:flutter/material.dart';
import 'package:udemy_flutter_bootcamp/challenge_9_clima/screens/loading_screen.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
