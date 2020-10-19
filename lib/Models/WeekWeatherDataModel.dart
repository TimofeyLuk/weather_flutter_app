import 'TodayWeatherDataModel.dart';

class WeekWeatherDataModel {
  final List<WeekForecastElement> list;
  final City city;

  WeekWeatherDataModel({this.list, this.city});

  factory WeekWeatherDataModel.fromJson(Map<String, dynamic> json) {
    return WeekWeatherDataModel(
      list: List<WeekForecastElement>.from(json["list"].map((x) => WeekForecastElement.fromJson(x))),
      city: City.fromJson(json["city"]),
    );
  }
}

class WeekForecastElement {
  final Main main;
  final List<Weather> weather;
  final String dt_txt;

  WeekForecastElement({this.main, this.weather, this.dt_txt});

  factory WeekForecastElement.fromJson(Map<String, dynamic> json) {
    return WeekForecastElement(
        main: Main.fromJson(json["main"]),
        weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        dt_txt: json["dt_txt"] as String,
    );
  }
}

class City {
  final String name;

  City({this.name});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      name: json['name'] as String,
    );
  }
}