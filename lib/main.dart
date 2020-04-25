import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_flutter_app/WeatherDetail.dart';
import 'package:weather_flutter_app/model/weather.dart';
import 'package:weather_flutter_app/service/WeatherService.dart';

void main() {
  runApp(WeatherListPage());
}

class WeatherListPage extends StatefulWidget {
  @override
  MyApp createState() => MyApp();
}

class MyApp extends State<WeatherListPage> {
  bool weather;

  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Mixed List';
    return MaterialApp(
      title: title,
      home: Scaffold(
          body: Center(
            child: FutureBuilder<List<Weather>>(
              future: WeatherService.getAllWeathers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return buildWeatherItem(snapshot.data);
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          )),
    );
  }

  Widget futureBuilder() {
    return FutureBuilder<List<Weather>>(
      future: WeatherService.getAllWeathers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return buildWeatherItem(snapshot.data);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Future<Null> getData() async {
    setState(() {
      weather = weather = true? false : true;
    });
    return null;
  }

  Widget buildWeatherItem(List<Weather> items) {
    return Scaffold(
      body: new RefreshIndicator(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (ctx, index) {
              return InkWell(
                child: ListTile(
                  leading: Hero(
                    tag: items[index].cityName,
                    child: Image.asset(
                        "assets/icons/" + items[index].image.icon + ".png"),
                  ),
                  title: Text(
                    items[index].cityName,
                    style: TextStyle(
                      fontSize: 48.0,
                    ),
                  ),
                  subtitle: Text(items[index].appTemp.toString()+"ºC"),
                ),
                onTap: (){
                  Navigator.of(ctx).push(
                    MaterialPageRoute(
                      builder: (ctx) => WeatherDetail(items[index].dewpt, items[index].windSpeed, items[index].cityName, items[index].appTemp, items[index].image.icon,
                          items[index].lat, items[index].long, items[index].rh, items[index].country, items[index].obtime),
                    )
                  );
                },
              );
            },
          ),
          onRefresh: () => getData()
      ),
    );
  }
}
