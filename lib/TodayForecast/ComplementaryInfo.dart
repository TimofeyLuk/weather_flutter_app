import 'dart:ui';
import 'package:flutter/material.dart';

class ComplementaryInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ComplementaryInfoState();
  }
}

class _ComplementaryInfoState extends State<ComplementaryInfo> {
  String _c;
  String _humidity;
  String _pressure;
  String _SE;
  String _windSpeed;

  void initState() {
    _c = "-- hPa";
    _humidity = "-- mm";
    _pressure = "-- %";
    _SE = "--";
    _windSpeed = "-- km/h";
    super.initState();
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
                      Text(_pressure)
                    ],
                  ), //1
                  Column(
                    children: [
                      Image.asset(
                        "icons/humidity.png",
                        width: 20,
                        height: 20,
                      ),
                      Text(_humidity)
                    ],
                  ), //2
                  Column(
                    children: [
                      Image.asset(
                        "icons/C.png",
                        width: 20,
                        height: 20,
                      ),
                      Text(_c)
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
                        Text(_windSpeed)
                      ],
                    ), //1
                    Column(
                      children: [
                        Image.asset(
                          "icons/SE.png",
                          width: 20,
                          height: 20,
                        ),
                        Text(_SE)
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