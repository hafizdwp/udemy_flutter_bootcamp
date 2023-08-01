import 'package:flutter/material.dart';
import 'package:udemy_flutter_bootcamp/challenge_10_crypto_tracker/ui/coyn.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light, fontFamily: 'poppins'),
      home: Coyn(),
    );
  }
}
