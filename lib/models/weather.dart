import 'package:flutter/cupertino.dart';

class Weather {
  String city;
  double temp;
  int clouds;
  String windDirection;

  Weather(
      {@required this.city,
      @required this.temp,
      @required this.clouds,
      @required this.windDirection});

  @override
  String toString() {
    return 'Weather{city: $city, temp: $temp, clouds: $clouds, windDirection: $windDirection}';
  }

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
      city: json['city_name'],
      temp: json['temp'].toDouble(),
      clouds: json['clouds'],
      windDirection: json['wind_cdir_full']
  );

  Map<String, dynamic> toJson() => {
    'city_name': city,
    'temp': temp,
    'clouds': clouds,
    'wind_cdir_full': windDirection,
  };
}
