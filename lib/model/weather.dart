import 'package:weather_flutter_app/model/Icon.dart';

class Weather {
  num dewpt;
  num windSpeed;
  String cityName;
  num appTemp;
  Icon image;
  num lat;
  num long;
  num rh;
  String country;
  String obtime;

  Weather(this.dewpt, this.windSpeed, this.cityName, this.appTemp, this.image,
      this.lat, this.long, this.rh, this.country, this.obtime);

  factory Weather.fromJson(Map<String, dynamic> json) {
    List<dynamic> data = json['data'];
    return Weather(
        data[0]["dewpt"],
        data[0]["wind_spd"],
        data[0]["city_name"],
        data[0]["temp"],
        Icon.fromJson(data[0]["weather"]),
        data[0]["lat"],
        data[0]["lon"],
        data[0]["rh"],
        data[0]["country_code"],
        data[0]["sunset"]
    );
  }

  @override
  String toString() {
    return 'Weather{dewpt: $dewpt, windSpeed: $windSpeed, cityName: $cityName, appTemp: $appTemp}';
  }
}
