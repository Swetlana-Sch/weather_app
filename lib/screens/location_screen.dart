import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/widgets/drawer.dart';

// here we get weather in the current location
class LocationScreen extends StatefulWidget {
  static const routeName = '/location-screen';

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    super.initState();
    final weatherByLocation =
        Provider.of<WeatherProvider>(context, listen: false);
    weatherByLocation.fetchLocationWeather();
  }

  @override
  Widget build(BuildContext context) {
    final weatherByLocation = Provider.of<WeatherProvider>(context);
    var weatherObject = weatherByLocation.weatherObject;
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather now'),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (weatherByLocation?.weatherObject?.city != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                  child: Text(
                    'Welcome in: ${weatherObject.city}',
                    style: kWelcomeIn,
                  ),
                ),
              ),
            Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Weather now',
                style: kWeatherNow,
              ),
            ),
            weatherByLocation.isLoadingLocation
                ? CircularProgressIndicator()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
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
                          Align(alignment: Alignment.centerLeft,child: Text('Temperature: ${weatherObject.temp}', style: kTextStyleInfo)),
                          Divider(),
                          Align(alignment: Alignment.centerLeft,child: Text('Clouds: ${weatherObject.clouds}', style: kTextStyleInfo)),
                          Divider(),
                          Align(alignment: Alignment.centerLeft,child: Text('Wind: ${weatherObject.windDirection}', style: kTextStyleInfo)),
                        ],
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
