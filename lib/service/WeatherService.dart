import 'dart:convert';

import 'package:weather_flutter_app/model/weather.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static final String API_KEY = "2a5edfd792f94a2f8c3e18aab4acd7c8";
  static final String API_URL = "http://api.weatherbit.io/v2.0/";
  static var cities = ["41.3887901|2.1589899", "39.4697500|-0.3773900", "39.9783558|-6.5039627", "40.6643|-73.9385", "52.5243683|13.4105301", "64.1353|-21.8952", "48.8534000|2.3486000", " 41.8905|12.4942", "-23.5475006|-46.6361084", "-34.6131516|-58.3772316"];
  static Future<Weather> fetchWeather(String lat, String lon) async {
    final response = await http.get(API_URL+"current?lat="+lat+"&lon="+lon+"&key=2a5edfd792f94a2f8c3e18aab4acd7c8");

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
     Weather weather = Weather.fromJson(json.decode(response.body));
     print(weather.toString());
      return weather;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load weather');
    }
  }
  static Future<List<Weather>> getAllWeathers() async{
    List<Weather> weathers = new List();
    for (int i=0;i<cities.length;i++){
      var latitudeAndAltitud = cities[i].split("|");
      final response = await http.get(API_URL+"current?lat="+latitudeAndAltitud[0]+"&lon="+latitudeAndAltitud[1]+"&key=2a5edfd792f94a2f8c3e18aab4acd7c8");
      Weather weather = Weather.fromJson(json.decode(response.body));
      print(response.body);
      print(latitudeAndAltitud[0]);
      print(latitudeAndAltitud[1]);
      print(weather.toString());
      weathers.add(weather);
    }
    return weathers;
  }
}