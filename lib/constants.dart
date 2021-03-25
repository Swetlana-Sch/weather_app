import 'package:flutter/material.dart';

const kTextInputDecoration = InputDecoration(
  fillColor: Colors.teal,
  icon: Icon(
    Icons.location_city_sharp,
    color: Colors.teal,
  ),
  hintText: 'Type City Name',
  hintStyle: TextStyle(
    color: Colors.teal,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(12),
    ),
  ),
);

const kWeatherNow = TextStyle(fontWeight: FontWeight.w500, fontSize: 18);

const kWelcomeIn =
    TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87);

const kTextStyleInfo = TextStyle(fontSize: 16);
