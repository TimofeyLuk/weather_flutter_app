import 'package:flutter/material.dart';
import 'package:weather_flutter_app/Models/WeekWeatherDataModel.dart';
import 'package:weather_flutter_app/Services/HTTP-ReqestsService.dart';

class WeekForecastScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    List<Cell> cels = [];
    Future<WeekWeatherDataModel> data = fetchWeekWeather();

    return Center(
         child: FutureBuilder<WeekWeatherDataModel>(
          future: data,
          builder: (context, snapshot) {
            if (snapshot.hasData){
              for(int i = 0; i < snapshot.data.list.length; i++){
                cels.add(Cell(i));
              }
              return ListView(
                children: cels,
              );
            } else if (snapshot.hasError) {
                print("${snapshot.error}");
                return Text("Can't load info");
            }
            return CircularProgressIndicator();
          },
        ),
    );
  }

}

class Cell extends StatefulWidget {
  int index;
  Cell(int ind){
    index = ind;
  }
  @override
  State<StatefulWidget> createState() {
    return _CellState(index);
  }
}

class _CellState extends State<Cell> {

  Future<WeekWeatherDataModel> data;
  int index;

  _CellState(int ind){
    index = ind;
  }

  void initState() {
    data = fetchWeekWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Expanded(
            flex: 2,
            child: FutureBuilder<WeekWeatherDataModel>(
              future: data,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Image.network(
                    'https://openweathermap.org/img/wn/${snapshot.data.list[index].weather[0].icon}@2x.png',
                    width: 80,
                    height: 80,
                  );
                } else if (snapshot.hasError) {
                  print("${snapshot.error}");
                  return Image.asset(
                    "icons/?.png",
                    width: 80,
                    height: 80,
                  );
                }
                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ),
          ),

          Expanded(
            flex: 5, // 60%
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<WeekWeatherDataModel>(
                  future: data,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      String time = snapshot.data.list[index].dt_txt;
                      time = time.substring(time.indexOf(' ') + 1, (time.indexOf(' ') + 6));
                      return Text(
                        time,
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      );
                    } else if (snapshot.hasError) {
                      print("${snapshot.error}");
                      return Text(
                        "No data",
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      );
                    }
                    return Text("--");
                  },
                ),

                FutureBuilder<WeekWeatherDataModel>(
                  future: data,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      String description = snapshot.data.list[index].weather[0].description;
                      return Text(
                        description,
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      );
                    } else if (snapshot.hasError) {
                      print("${snapshot.error}");
                      return Text(
                        "No data",
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      );
                    }
                    return Text("--");
                  },
                ),
              ],
            ),
          ),

          Expanded(
            flex: 3, // 20%
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FutureBuilder<WeekWeatherDataModel>(
                  future: data,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data.list[index].main.temp.toString() + "˚C",
                        style: TextStyle(color: Colors.blue, fontSize: 25.0),
                      );
                    } else if (snapshot.hasError) {
                      print("${snapshot.error}");
                      return Text(
                        "--",
                        style: TextStyle(color: Colors.blue, fontSize: 25.0),
                      );
                    }
                    return Text("--");
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 15.0),
          )
        ],
    );
  }

}
