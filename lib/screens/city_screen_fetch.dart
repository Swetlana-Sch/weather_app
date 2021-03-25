import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/widgets/drawer.dart';

class CityScreenFetch extends StatelessWidget {
  static const routeName = '/city-screen-fetch';

  @override
  Widget build(BuildContext context) {
    final fetchCityWeather = Provider.of<WeatherProvider>(context);
    var cityWeather = fetchCityWeather.cityWeatherObject;
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather now'),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Column(
            children: [
              if (fetchCityWeather?.cityWeatherObject?.city != null)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.teal,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        fetchCityWeather.isLoadingCity
                            ? CircularProgressIndicator()
                            : Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    'The weather in: ${cityWeather.city}',
                                    style: kTextStyleInfo),
                              ),
                        Divider(),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Temperature: ${cityWeather.temp}',
                              style: kTextStyleInfo),
                        ),
                        Divider(),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Clouds: ${cityWeather.clouds}',
                              style: kTextStyleInfo),
                        ),
                        Divider(),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Wind: ${cityWeather.windDirection}',
                              style: kTextStyleInfo),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
