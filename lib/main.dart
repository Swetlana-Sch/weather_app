import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/screens/city_screen_fetch.dart';
import 'package:weather_app/screens/loading_screen.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/screens/search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: MyHomePage(),
        theme: ThemeData(primarySwatch: Colors.teal),
        routes: {
          LocationScreen.routeName: (ctx) => LocationScreen(),
          SearchScreen.routeName: (ctx) => SearchScreen(),
          CityScreenFetch.routeName: (ctx) => CityScreenFetch(),
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoadingScreen();
  }
}
