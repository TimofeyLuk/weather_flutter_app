import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_flutter_app/Models/TodayWeatherDataModel.dart';
import 'package:weather_flutter_app/Services/HTTP-ReqestsService.dart';


class Info {
  static double temp;
  static String description;
}

class MainInfoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainInfoWidgetState();
  }
}

class _MainInfoWidgetState extends State<MainInfoWidget> {
  String location;
  String weather;
  Future<TodayWeatherDataModel> data;

  @override
  void initState() {
    weather = "-- C | Error";
    data = fetchTodayWeather();
    super.initState();
  }

  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: new Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: Column(
          children: [

            FutureBuilder<TodayWeatherDataModel>(
              future: data,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Image.network(
                    'https://openweathermap.org/img/wn/${snapshot.data.weather[0].icon}@2x.png',
                    width: 100,
                    height: 100,
                  );
                } else if (snapshot.hasError) {
                  print("${snapshot.error}");
                  return Image.asset(
                    "icons/?.png",
                    width: 100,
                    height: 100,
                  );
                }
                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ),

            FutureBuilder<TodayWeatherDataModel>(
              future: data,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    (snapshot.data.name) + ", " + (snapshot.data.sys.country),
                    style: TextStyle(color: Colors.black, fontSize: 12.0),
                  );
                } else if (snapshot.hasError) {
                  print("${snapshot.error}");
                  return Text(
                      "No location",
                      style: TextStyle(color: Colors.black, fontSize: 12.0),
                  );
                }
                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ),

            FutureBuilder<TodayWeatherDataModel>(
              future: data,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Info.temp = snapshot.data.main.temp;
                  Info.description = snapshot.data.weather[0].description;
                  return Text(
                    (snapshot.data.main.temp).toString() + " ˚C | " + (snapshot.data.weather[0].description),
                    style: TextStyle(color: Colors.blue, fontSize: 24.0),
                  );
                } else if (snapshot.hasError) {
                  print("${snapshot.error}");
                  return Text(
                    "-- ˚C | No data",
                    style: TextStyle(color: Colors.blue, fontSize: 24.0),
                  );
                }
                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ),

            Container(
              margin: const EdgeInsets.only(
                top: 20.0,
              ),
              width: ScreenWidth / 2.0,
              child: Divider(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}