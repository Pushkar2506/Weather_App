import 'dart:convert';

import 'package:http/http.dart' as http;

class worker {
  String? location;

  // Constructor
  worker({this.location})
  {
    location = this.location;
  }


  String? temp;
  String? humidity;
  String? air_speed;
  String? description;
  String? main;
  String? icon;

  Future<void> getData() async {
    try{
      Uri url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=9f72e1c3cd8a842ea959475676e68504');
      http.Response response = await http.get(url);
      Map data = jsonDecode(response.body);
      print(data);

//Getting Temp,Humidity
      Map temp_data = data['main'];
      double getTemp = temp_data['temp']-273.15;
      String getHumidity = temp_data['humidity'].toString();

//Getting air_speed
      Map wind = data['wind'];
      double getAir_speed = wind['speed']/0.27777777777778;

//Getting Description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_desc = weather_main_data['main'];
      String getDesc = weather_main_data['description'];

//Assigning values
      temp = getTemp.toString();
      humidity = getHumidity;
      air_speed = getAir_speed.toString();
      description = getDesc;
      main = getMain_desc;
      icon = weather_main_data['icon'];
    }catch(e){
      temp = "NA";
      humidity = "NA";
      air_speed = "NA";
      description = "Can't find data";
      main = "NA";
      icon = "03n";
    }

  }
}