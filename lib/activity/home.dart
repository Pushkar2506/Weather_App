
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print("This is a init state");
  }

  @override
  void setState(fn) {
    super.setState(fn);
    print("setState called");
  }

  @override
  void dispose() {
    super.dispose();
    print("widget destroyed");
  }

  void _handleSearch(String searchText) {
    if (searchText.trim().isEmpty) {
      print("Blank Search");
    } else {
      Navigator.pushReplacementNamed(
        context,
        "/loading",
        arguments: {"searchText": searchText},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Map? info = ModalRoute.of(context)?.settings.arguments as Map?;
    var city_name = ["Delhi", "Chennai", "Mumbai", "Bangalore", "Hyderabad", "Kolkata"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];

    String temp = info!['temp_value'].toString();
    String icon = info['icon_value'];
    String getcity = info['city_value'];
    String hum = info['hum_value'];
    String air = info['air_speed_value'].toString();
    String des = info['des_value'];

    if (temp == "NA") {
      print("NA");
    } else {
      temp = info['temp_value'].toString().substring(0, 4);
      air = info['air_speed_value'].toString().substring(0, 4);
    }
     print(icon);




    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: GradientAppBar(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.blue.shade100],
      ),
    ),
    ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue, Colors.lightBlueAccent],
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => _handleSearch(searchController.text),
                          child: Icon(Icons.search, color: Colors.blueAccent),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            onSubmitted: _handleSearch,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search $city",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Image.network("https://openweathermap.org/img/wn/$icon@2x.png"),
                            SizedBox(width: 20),
                            Column(
                              children: [
                                Text("$des", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text("in $getcity", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 300,
                        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        padding: EdgeInsets.all(26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.thermometer),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("$temp", style: TextStyle(fontSize: 90)),
                                Text("C", style: TextStyle(fontSize: 30)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        padding: EdgeInsets.all(26),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.day_windy),
                              ],
                            ),
                            Text("$air", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                            Text("Km/hr"),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 200,
                        margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        padding: EdgeInsets.all(26),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.humidity),
                              ],
                            ),
                            Text("$hum", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                            Text("Percent"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text("Made By Pushkar", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100)),
                SizedBox(height: 12),
                Text("Data Provided by Open Weather Map", style: TextStyle(fontSize: 10)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
