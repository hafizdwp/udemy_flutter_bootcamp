import 'package:flutter/material.dart';

void main() {
  runApp(const Challenge2());
}

class Challenge2 extends StatelessWidget {
  const Challenge2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: const Text("Mi Card"),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage("assets/images/gigachad.jpg")),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "GIGACHAD",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 10,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Flutter Developer".toUpperCase(),
                style: TextStyle(
                    color: Colors.teal.shade200,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 8),
              ),
              const SizedBox(
                width: 150,
                height: 25,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              const Card(
                color: Colors.white,
                shadowColor: Colors.black,
                margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    "0821-1716-6061",
                    style: TextStyle(color: Colors.teal),
                  ),
                ),
              ),
              const Card(
                color: Colors.white,
                shadowColor: Colors.black,
                margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text(
                    "gigachad@gmail.com",
                    style: TextStyle(color: Colors.teal),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
