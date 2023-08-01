import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Xylophone());
}

class Xylophone extends StatefulWidget {
  const Xylophone({Key? key}) : super(key: key);

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {

  void pressKey(Color color) {
    final player = AudioPlayer();
    switch (color) {
      case Colors.red:
        {
          player.play(AssetSource("wav/note1.wav"));
        }
        break;
      case Colors.orange:
        {
          player.play(AssetSource("wav/note2.wav"));
        }
        break;
      case Colors.yellow:
        {
          player.play(AssetSource("wav/note3.wav"));
        }
        break;
      case Colors.green:
        {
          player.play(AssetSource("wav/note4.wav"));
        }
        break;
      case Colors.blue:
        {
          player.play(AssetSource("wav/note5.wav"));
        }
        break;
      case Colors.indigo:
        {
          player.play(AssetSource("wav/note6.wav"));
        }
        break;
      case Colors.purple:
        {
          player.play(AssetSource("wav/note7.wav"));
        }
        break;

      default:
        {
          player.play(AssetSource("wav/note1.wav"));
        }
        break;
    }
  }

  Flexible buildKey(Color colors) {
    return Flexible(
      flex: 1,
      child: TextButton(
        onPressed: () {
          pressKey(colors);
        },
        style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size(50, 30),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            alignment: Alignment.centerLeft),
        child: Container(
          color: colors,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(Colors.red),
              buildKey(Colors.orange),
              buildKey(Colors.yellow),
              buildKey(Colors.green),
              buildKey(Colors.blue),
              buildKey(Colors.indigo),
              buildKey(Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}