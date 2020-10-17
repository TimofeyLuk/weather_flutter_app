import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'TodayForecast/TodayForecastScreen.dart';
import 'WeekForecast/WeekForecastScreen.dart';

void main() {
  runApp(
      App()
  );
}


class App extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Screens(),
    );
  }
}


class Screens extends StatefulWidget {
  Screens({Key key}) : super(key: key);

  @override
  _ScreensState createState() => _ScreensState();
}


class _ScreensState extends State<Screens> {
  int _selectedIndex = 0;
  String _title = "Today";

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  static  List<StatelessWidget> _widgetOptions = [
      TodayForecastScreen(),
      WeekForecastScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _title = ["Today","Forecast"][index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Today"),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: new Image.asset("icons/today_img.png"),
            label: 'Today',
          ),
          BottomNavigationBarItem(
            icon: new Image.asset("icons/forecast.png"),
            label: 'Forecast',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
      ),
    );
  }
}
