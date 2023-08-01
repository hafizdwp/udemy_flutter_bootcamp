import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:udemy_flutter_bootcamp/challenge_8_bmi_calculator/constant.dart';
import 'package:udemy_flutter_bootcamp/challenge_8_bmi_calculator/result_page.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

enum Gender { MALE, FEMALE }

Gender? selectedGender;

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 60;
  int age = 22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("BMI CALCULATOR")),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// top
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  /// top left
                  Expanded(
                    child: Card(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.MALE;
                        });
                      },
                      cardColor: selectedGender == Gender.MALE
                          ? kColorCardActive
                          : kColorCardInactive,
                      child: const GenderCard(
                        icon: FontAwesomeIcons.mars,
                        gender: "MALE",
                      ),
                    ),
                  ),

                  /// top right
                  Expanded(
                    child: Card(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.FEMALE;
                        });
                      },
                      cardColor: selectedGender == Gender.FEMALE
                          ? kColorCardActive
                          : kColorCardInactive,
                      child: const GenderCard(
                          icon: FontAwesomeIcons.venus, gender: "FEMALE"),
                    ),
                  ),
                ],
              ),
            ),

            /// middle
            Expanded(
                flex: 1,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "HEIGHT",
                        style: kStyleTextLabel,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kStyleTextNumber,
                          ),
                          Text(
                            "cm",
                            style: kStyleTextLabel,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: kColorSlideInactive,
                            activeTrackColor: Colors.white,
                            thumbColor: Color(0xffeb1555),
                            overlayColor: Color(0x29eb1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0)),
                        child: Slider(
                          min: 120.0,
                          max: 220.0,
                          value: height.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                )),

            /// bottom
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  /// bottom left (WEIGHT)
                  Expanded(
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: kStyleTextLabel,
                          ),
                          Text(weight.toString(), style: kStyleTextNumber),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  /// bottom right (AGE)
                  Expanded(
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: kStyleTextLabel,
                          ),
                          Text(age.toString(), style: kStyleTextNumber),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            /// calculate button
            Container(
              height: 80,
              child: Card(
                cardColor: Colors.red,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ResultsPage(selectedGender!, height, weight, age);
                  }));
                },
                child: Center(
                    child: Text(
                  "Calculate",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: 2),
                )),
              ),

            )
          ],
        ));
  }
}

class GenderCard extends StatelessWidget {
  const GenderCard({
    super.key,
    required this.icon,
    required this.gender,
  });

  final IconData icon;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          icon,
          size: 60,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          gender,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        )
      ],
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

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
    );
  }
}
