import 'dart:convert';
import 'dart:async';
import 'package:weather_flutter_app/Models/TodayWeatherDataModel.dart';
import "package:http/http.dart" as http;

Future<TodayWeatherDataModel> fetchTodayWeather() async {
  final response = await http.get('https://api.openweathermap.org/data/2.5/weather?lat=42&lon=38&units=metric&appid=a5fbd45eb862a80d161c5fb8d6c86008');

  if (response.statusCode == 200) {
    return TodayWeatherDataModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}