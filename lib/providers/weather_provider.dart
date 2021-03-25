import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_app/models/weather.dart';

const apiKey = 'ac15a9a893724d389f12ba14ae30856e';
const baseUrl = 'https://api.weatherbit.io/v2.0/current';

class WeatherProvider with ChangeNotifier {
  Weather weatherObject;
  Weather cityWeatherObject;
  double myLatitude;
  double myLongitude;
  String cityName;
  bool isLoadingLocation = false;
  bool isLoadingCity = false;

  Future<void> fetchLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print('position: $position');
      myLatitude = position.latitude;
      myLongitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchLocationWeather() async {
    final String url =
        '$baseUrl?lat=${myLatitude}&lon=${myLongitude}&key=$apiKey&include=minutely';
    print('String url: $url');
    isLoadingLocation = true;
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        dynamic decodedData = jsonDecode(response.body);
        print('json: $decodedData');
        final decodedWeatherData = decodedData['data'][0];

        print('Decoded temp: ${decodedWeatherData['temp'].runtimeType}');
        print('Decoded clouds: ${decodedWeatherData['clouds'].runtimeType}');

        weatherObject = Weather.fromJson(decodedWeatherData);
        print('WeatherObject to Json: ${weatherObject.toJson()}');
      } else {
        print(response.statusCode);
      }
      isLoadingLocation = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchWeatherByCity(String cityName) async {
    final String url = '$baseUrl?&city=$cityName&key=$apiKey&include=minutely';
    print('String cityUrl: $url');
    isLoadingCity = true;
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        dynamic decodedData = jsonDecode(response.body);
        print('json: $decodedData');
        final decodedWeatherData = decodedData['data'][0];
        cityWeatherObject = Weather.fromJson(decodedWeatherData);

      } else {
        print(response.statusCode);
      }
      isLoadingCity = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  // method that returns cityWeatherObject
  Future<Weather> getCityWeather(String cityName) async {
    final String url = '$baseUrl?&city=$cityName&key=$apiKey&include=minutely';
    print('String cityUrl: $url');

    isLoadingCity = true;
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        dynamic decodedData = jsonDecode(response.body);
        print('json: $decodedData');
        final decodedWeatherData = decodedData['data'][0];
        Weather cityWeatherObject = Weather.fromJson(decodedWeatherData);
        return cityWeatherObject;
      } else {
        print(response.statusCode);
      }
      isLoadingCity = false;
      notifyListeners();
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
