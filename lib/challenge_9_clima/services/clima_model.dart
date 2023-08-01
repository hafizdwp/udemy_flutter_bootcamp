import 'dart:convert';

import 'package:http/http.dart' as http;

import 'location.dart';

const String apiKey = "bb9e72851e1236176eabdf445fbaa1d3";
const String baseUrl = "https://api.openweathermap.org/data/2.5/weather";

class ClimaModel {
  Future<dynamic> getWeatherData() async {
    Location location = Location();
    await location.getLocation();

    Uri url = Uri.parse(
        "$baseUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");
    http.Response response = await http.get(url);

    return jsonDecode(response.body);
  }

  Future<dynamic> getWeatherDataByCityName(String cityName) async {
    Location location = Location();
    await location.getLocation();

    Uri url = Uri.parse(
        "$baseUrl?q=$cityName&lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");
    http.Response response = await http.get(url);

    return jsonDecode(response.body);
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getWeatherMessage(double temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
