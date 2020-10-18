import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_flutter_app/Models/TodayWeatherDataModel.dart';
import 'package:weather_flutter_app/Services/HTTP-ReqestsService.dart';

class ComplementaryInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ComplementaryInfoState();
  }
}

class _ComplementaryInfoState extends State<ComplementaryInfo> {
  String _pressure;
  String _humidity;
  String _clouds;
  String _SE;
  String _windSpeed;
  Future<TodayWeatherDataModel> data;

  void initState() {
    _pressure = "-- hPa";
    _humidity = "-- mm";
    _clouds = "-- %";
    _SE = "--";
    _windSpeed = "-- km/h";
    data = fetchTodayWeather();
    super.initState();
  }

  String getCompasDirection (int value) {
    if (value == null) return "--";
    if ((value >= 0 && value < 16) || (value >= 345 && value <= 360)) return "N";
    if (value >= 16 && value < 74) return "NE";
    if (value >= 75 && value <= 105) return "E";
    if (value >= 106 && value <= 164) return "SE";
    if (value >= 165 && value <= 195) return "S";
    if (value >= 196 && value <= 254) return "SW";
    if (value >= 255 && value <= 285) return "W";
    if (value >= 286 && value <= 344) return "NW";

    return "--";
  }
  @override
  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery.of(context).size.width;
    return Center(
        child: new Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset(
                    "icons/pressure.png",
                    width: 20,
                    height: 20,
                  ),

                  FutureBuilder<TodayWeatherDataModel>(
                    future: data,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          (snapshot.data.clouds.all).toString() + " %",
                        );
                      } else if (snapshot.hasError) {
                        print("${snapshot.error}");
                        return Text(_clouds);
                      }
                      // By default, show a loading spinner.
                      return CircularProgressIndicator();
                    },
                  )
                ],
              ), //1
              Column(
                children: [
                  Image.asset(
                    "icons/humidity.png",
                    width: 20,
                    height: 20,
                  ),

                  FutureBuilder<TodayWeatherDataModel>(
                    future: data,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          (snapshot.data.main.humidity).toString() + " mm",
                        );
                      } else if (snapshot.hasError) {
                        print("${snapshot.error}");
                        return Text(_humidity);
                      }
                      // By default, show a loading spinner.
                      return CircularProgressIndicator();
                    },
                  )
                ],
              ), //2
              Column(
                children: [
                  Image.asset(
                    "icons/C.png",
                    width: 20,
                    height: 20,
                  ),
                  FutureBuilder<TodayWeatherDataModel>(
                    future: data,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          (snapshot.data.main.pressure).toString() + " hPa",
                        );
                      } else if (snapshot.hasError) {
                        print("${snapshot.error}");
                        return Text(_pressure);
                      }
                      // By default, show a loading spinner.
                      return CircularProgressIndicator();
                    },
                  )
                ],
              ), //3
            ],
          ),
          new Container(
            margin: const EdgeInsets.only(top: 35.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "icons/windSpeed.png",
                      width: 20,
                      height: 20,
                    ),
                    FutureBuilder<TodayWeatherDataModel>(
                      future: data,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            (snapshot.data.wind.speed).toString() + " km/h",
                          );
                        } else if (snapshot.hasError) {
                          print("${snapshot.error}");
                          return Text(_windSpeed);
                        }

                        // By default, show a loading spinner.
                        return CircularProgressIndicator();
                      },
                    )
                  ],
                ), //1
                Column(
                  children: [
                    Image.asset(
                      "icons/SE.png",
                      width: 20,
                      height: 20,
                    ),
                    FutureBuilder<TodayWeatherDataModel>(
                      future: data,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                            return Text(
                              getCompasDirection(snapshot.data.wind.deg),
                            );
                        } else if (snapshot.hasError) {
                          print("${snapshot.error}");
                          return Text(_SE);
                        }

                        // By default, show a loading spinner.
                        return CircularProgressIndicator();
                      },
                    )
                  ],
                ), //2
              ],
            ),
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
    ));
  }
}
