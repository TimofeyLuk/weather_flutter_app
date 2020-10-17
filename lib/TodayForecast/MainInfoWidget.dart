import 'dart:ui';
import 'package:flutter/material.dart';


class MainInfoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainInfoWidgetState();
  }
}

class _MainInfoWidgetState extends State<MainInfoWidget> {
  String location;
  String weather;

  @override
  void initState() {
    location = "Error, ER";
    weather = "-- C | Error";
    super.initState();
  }

  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: new Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            Image.asset(
              "icons/?.png",
              width: 100,
              height: 100,
            ),
            Text(
              "$location",
              style: TextStyle(color: Colors.black, fontSize: 12.0),
            ),
            Text(
              "$weather",
              style: TextStyle(color: Colors.blue, fontSize: 24.0),
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