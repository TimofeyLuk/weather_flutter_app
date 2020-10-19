class TodayWeatherDataModel {
  final MyCoord coord;
  final List<Weather> weather;
  final String base;
  final Main main;
  final int visibility;
  final Wind wind;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  TodayWeatherDataModel({this.coord, this.weather, this.base, this.main, this.visibility, this.wind, this.clouds, this.dt, this.sys, this.timezone, this.id, this.name, this.cod});

  factory TodayWeatherDataModel.fromJson(Map<String, dynamic> json) {
    return TodayWeatherDataModel(
      coord: MyCoord.fromJson(json['coord']),
      weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
      base: json['base'] as String,
      main: Main.fromJson(json['main']),
      visibility: json['visibility'] as int,
      wind: Wind.fromJson(json['wind']),
      clouds: Clouds.fromJson(json['clouds']),
      dt: json['dt'] as int,
      sys: Sys.fromJson(json['sys']),
      timezone: json['timezone'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      cod: json['cod'] as int,
    );
  }
}


class MyCoord {
  final int lon;
  final int lan;

  MyCoord({this.lon, this.lan});

  factory MyCoord.fromJson(Map<String, dynamic> json) {
    return MyCoord(
      lon: json['lon'] as int,
      lan: json['lan'] as int,
    );
  }
}


class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id']  as int,
      main: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );
  }
}


class Main {
  final dynamic temp;
  final dynamic feels_like;
  final dynamic temp_min;
  final dynamic temp_max;
  final int pressure;
  final int humidity;

  Main({this.temp, this.feels_like, this.temp_min, this.temp_max, this.pressure, this.humidity});

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json['temp'],
      feels_like: json['feels_like'],
      temp_min: json['temp_min'],
      temp_max: json['temp_max'],
      pressure: json['pressure'] as int,
      humidity: json['humidity'] as int,
    );
  }
}


class Wind {
  final double speed;
  final int deg;

  Wind({this.speed, this.deg});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'] as double,
      deg: json['deg'] as int,
    );
  }
}


class Clouds {
  final int all;

  Clouds({this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      all: json['all'] as int,
    );
  }
}


class Sys {
  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  Sys({this.type, this.id, this.country, this.sunrise, this.sunset});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
        type: json['type'] as int,
        id: json['id'] as int,
        country: json['country'] as String,
        sunrise: json['sunrise'] as int,
        sunset: json['sunrise'] as int
    );
  }
}