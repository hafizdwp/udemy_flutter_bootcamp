import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:udemy_flutter_bootcamp/challenge_11_flash_chat/ui/login_screen.dart';
import 'package:udemy_flutter_bootcamp/challenge_11_flash_chat/ui/register_screen.dart';
import 'package:udemy_flutter_bootcamp/challenge_11_flash_chat/util/const.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({Key? key}) : super(key: key);

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    controller.forward();

    animation =
        ColorTween(begin: Colors.red, end: Colors.white).animate(controller);

    controller.addListener(() {
      setState(() {});
      print(controller.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void gotoLogin() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const LoginScreen();
    }));
  }

  void gotoRegister() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const RegisterScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          color: animation.value,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// logo
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: Const.TAG_FLASH_LOGO,
                    child: Image.asset(
                      "assets/images/bg_flash_chat.png",
                      width: 70,
                      height: 70,
                    ),
                  ),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText("Flash Chat!",
                          textStyle: const TextStyle(
                              fontSize: 32.0, fontWeight: FontWeight.bold),
                          speed: const Duration(milliseconds: 200))
                    ],
                    totalRepeatCount: 4,
                    pause: const Duration(milliseconds: 1000),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  )
                ],
              ),
              SizedBox(
                height: 32,
              ),

              /// LOGIN
              Container(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    gotoLogin();
                  },
                  child: Text("Login"),
                ),
              ),
              SizedBox(
                height: 16,
              ),

              /// REGISTER
              Container(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    gotoRegister();
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                  child: Text("Register"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
