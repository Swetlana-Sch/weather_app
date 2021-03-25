import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/widgets/drawer.dart';

// here will be weather of the chosen city
class CityScreen extends StatefulWidget {
  static const routeName = '/city-screen';

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  @override
  Widget build(BuildContext context) {

    final typedCityName = ModalRoute.of(context).settings.arguments as Weather;
    return Scaffold(
      appBar: AppBar(),
      drawer: AppDrawer(),
      body: Column(
        children: [
            Column(
                    children: [
                      Text(
                          'The weather in: ${typedCityName.city}'),
                      Text(
                          'Temperature: ${typedCityName.temp}'),
                      Text('Clouds: ${typedCityName.clouds}'),
                      Text(
                          'Wind: ${typedCityName.windDirection}'),
                    ],
                  )
        ],
      ),
    );
  }
}
