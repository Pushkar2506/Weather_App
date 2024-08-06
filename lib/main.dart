



import 'package:flutter/material.dart';
import 'package:weather_app/activity/home.dart';
import 'package:weather_app/activity/loading.dart';
import 'package:weather_app/activity/location.dart';
import 'package:weather_app/activity/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
   //home: Home(),
    routes: {
      "/": (context)=>Loading(),
      "/home" : (context)=>Home(),
      "/loading" : (context)=>Loading(),
    },
  ));
}

