import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/screens/city_screen_fetch.dart';
import 'package:weather_app/widgets/drawer.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search-screen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String cityName;
  @override
  Widget build(BuildContext context) {
    final cityWeather = Provider.of<WeatherProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      drawer: AppDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: TextField(
                onChanged: (value) {
                  cityName = value;
                },
                decoration: kTextInputDecoration,
              ),
            ),
          ),
          RaisedButton(
            color: Colors.teal.shade500,
              textColor: Colors.white,
              child: Text('Get weather'),
              onPressed: () async {
                await cityWeather.fetchWeatherByCity(cityName);
                Navigator.of(context).pushNamed(CityScreenFetch.routeName);
              }),
        ],
      ),
    );
  }
}
