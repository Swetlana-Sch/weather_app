import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/location_screen.dart';

// shows while loading
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    final weatherData = Provider.of<WeatherProvider>(context, listen: false);
    weatherData.fetchLocation().then((_) {
      print('Location: ${weatherData.myLongitude}');
      print('Location: ${weatherData.myLatitude}');
      Navigator.of(context).pushReplacementNamed(LocationScreen.routeName);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.teal,
          size: 80.0,
        ),
      ),
    );
  }
}
