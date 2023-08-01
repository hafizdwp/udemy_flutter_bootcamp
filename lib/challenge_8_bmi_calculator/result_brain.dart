import 'package:flutter/material.dart';

import 'input_page.dart';

class ResultBrain {
  final Gender gender;
  final int height;
  final int weight;
  final int age;

  ResultBrain(
      {required this.gender,
      required this.height,
      required this.weight,
      required this.age});

  Color _statusColor = Colors.red;

  double calculateBmi() {
    return double.parse(
        (weight / ((height / 100) * (height / 100))).toStringAsFixed(1));
  }

  String getStatusResult() {
    String result = "";
    double bmi = calculateBmi();

    if (bmi < 18.5) {
      result = "UNDERWEIGHT";
      _statusColor = Colors.red;
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      result = "NORMAL";
      _statusColor = Colors.white;
    } else if (bmi >= 25.0 && bmi <= 29.9) {
      result = "OVERWEIGHT";
      _statusColor = Colors.yellow;
    } else {
      result = "OBESITY";
      _statusColor = Colors.red;
    }

    return result;
  }

  String getDescResult() {
    String desc = "";
    double bmi = calculateBmi();

    if (bmi < 18.5) {
      desc = "Kamu kerempeng";
      _statusColor = Colors.red;
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      desc = "Selamat! Kamu normal";
      _statusColor = Colors.white;
    } else if (bmi >= 25.0 && bmi <= 29.9) {
      desc = "Awas! Kamu kelebihan berat badan";
      _statusColor = Colors.yellow;
    } else {
      desc = "GENDUT!!!";
      _statusColor = Colors.red;
    }

    return desc;
  }

  Color getStatusColor() => _statusColor;
}
