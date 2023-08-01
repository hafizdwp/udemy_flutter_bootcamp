import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:udemy_flutter_bootcamp/challenge_9_clima/screens/weather_screen.dart';
import 'package:udemy_flutter_bootcamp/challenge_9_clima/services/clima_model.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  void getWeatherData() async {
    var weatherData = await ClimaModel().getWeatherData();
    print(weatherData);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(weatherData: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SpinKitWave(
            color: Colors.white,
            size: 120,
          ),
        ),
      ),
    );
  }
}
