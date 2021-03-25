import 'package:flutter/material.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/screens/search_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(title: Text(
            'Weather App',
          ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.wb_sunny_outlined),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(LocationScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.search_rounded),
            title: Text('Search'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(SearchScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
