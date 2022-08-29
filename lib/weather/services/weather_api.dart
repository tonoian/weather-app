import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:my_weather/weather/model/weather_model.dart';

const apiKey = '59fe466420b7220a8c0755c6758072d6';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherApi {
  Future<Weather>? getCurrentWeather(double lon, double lat) async {
    var endpoint =
        Uri.parse('$openWeatherMapURL?lat=$lat&lon=$lon&appid=$apiKey&units=metric');
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
