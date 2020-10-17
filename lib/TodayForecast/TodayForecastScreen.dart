import 'dart:ui';
import 'package:flutter/material.dart';
import 'MainInfoWidget.dart';
import 'ComplementaryInfo.dart';


class TodayForecastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          MainInfoWidget(),
          ComplementaryInfo(),
          new Container(
            margin: const EdgeInsets.only(top: 40.0),
            child: FlatButton(
              textColor: Colors.orange,
              child: Text(
                "Share",
              ),
              onPressed: () {},
              )
            ),
        ],
      );
  }
}