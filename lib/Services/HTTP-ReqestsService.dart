import 'dart:convert';
import 'dart:async';
import 'package:weather_flutter_app/Models/TodayWeatherDataModel.dart';
import "package:http/http.dart" as http;
import 'package:weather_flutter_app/Models/WeekWeatherDataModel.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';


Future<TodayWeatherDataModel> fetchTodayWeather() async {

  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  int lat = position.latitude.toInt();
  int lon = position.longitude.toInt();

  final response = await http.get('https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&units=metric&appid=a5fbd45eb862a80d161c5fb8d6c86008');

  if (response.statusCode == 200) {
    return TodayWeatherDataModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<WeekWeatherDataModel> fetchWeekWeather() async {

  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  int lat = position.latitude.toInt();
  int lon = position.longitude.toInt();

  final response = await http.get('https://api.openweathermap.org/data/2.5/forecast?lat=${lat}&lon=${lon}&units=metric&appid=a5fbd45eb862a80d161c5fb8d6c86008');
  if (response.statusCode == 200) {
    return WeekWeatherDataModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}