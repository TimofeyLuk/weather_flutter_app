import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
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
              onPressed: () => share(context),
              )
            ),
        ],
      );
  }

  void share (BuildContext context) {
    final RenderBox box = context.findRenderObject();
    final String text = "Weather will be ${Info.description} ${Info.temp} ˚C";
    Share.share(text, sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}