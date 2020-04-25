import 'package:flutter/material.dart';

class WeatherDetail extends StatelessWidget {
  num dewpt;
  num windSpeed;
  String cityName;
  num appTemp;
  String image;
  num lat;
  num long;
  num rh;
  String country;
  String obtime;
  WeatherDetail(this.dewpt, this.windSpeed, this.cityName, this.appTemp,
      this.image, this.lat, this.long, this.rh, this.country, this.obtime);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            width: screenSize.shortestSide - 20,
            height: screenSize.shortestSide - 20,
            child: Stack(
              children: <Widget>[
                Hero(
                  child: Image.asset(
                    "assets/icons/" + image + ".png",
                    width: 400,
                    height: 300,
                  ),
                  tag: cityName,
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    color: Color.fromRGBO(10, 50, 90, 140),
                    child: Row(
                      children: <Widget>[
                        Text(
                          cityName + " ",
                          style: TextStyle(
                            fontSize: 35.0,
                          ),
                        ),
                        Text(
                          appTemp.toString() + "º",
                          style: TextStyle(
                            fontSize: 35.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.only(top: 20, left: 25),
            child: Table(
              children: [
                TableRow(children: [
                  Text(
                    "Country",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Text(country.toString(), style: TextStyle(fontSize: 18))
                ]),
                TableRow(children: [
                  Text(
                    "Latitude",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Text(lat.toString(), style: TextStyle(fontSize: 18))
                ]),
                TableRow(children: [
                  Text(
                    "Longitude",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Text(long.toString(), style: TextStyle(fontSize: 18))
                ]),
                TableRow(children: [
                  Text(
                    "Dew point",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Text(dewpt.toString() + "º", style: TextStyle(fontSize: 18))
                ]),
                TableRow(children: [
                  Text(
                    "Temp",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Text(appTemp.toString() + "º", style: TextStyle(fontSize: 18))
                ]),
                TableRow(children: [
                  Text(
                    "Wind Speed",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Text(windSpeed.toString() + " m/s",
                      style: TextStyle(fontSize: 18))
                ]),
                TableRow(children: [
                  Text(
                    "Humidity",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Text(rh.toString() + "%", style: TextStyle(fontSize: 18))
                ]),
                TableRow(children: [
                  Text(
                    "Sunset",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Text(obtime.toString(), style: TextStyle(fontSize: 18))
                ])
              ],
            ),
          )
        ],
      ),
    );
  }
}
