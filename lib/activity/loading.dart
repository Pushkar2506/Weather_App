import 'package:flutter/material.dart';
import 'package:weather_app/worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String? temp;
  String? hum;
  String? air_speed;
  String? des;
  String? main;
  String? icon;
  String? city = "Indore";


  void start_app (String city)async
  {
    worker instance = worker(location: city);
    await instance.getData();

    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    icon =instance.icon;
    Future.delayed(Duration(seconds: 1,),(){
      Navigator.pushReplacementNamed(context, "/home",arguments: {
        "temp_value" : temp,
        "hum_value" : hum,
        "air_speed_value" : air_speed,
        "des_value" : des,
        "main_value" : main,
        "icon_value" : icon,
        "city_value" : city,
      });
    });


  }


  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Map? search = ModalRoute.of(context)?.settings.arguments as Map?;
    if(search?.isNotEmpty ?? false)
    {
      city = search?['searchText'];
    }
    start_app(city!);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             SizedBox(height: 180,),
             Image.asset("assets/images/weather_logo.png",height: 250, width: 250,),
             SizedBox(height: 10,),
             Text("Weather App",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
             SizedBox(height: 10,),
             Text("Made By Pushkar",style: TextStyle(fontWeight: FontWeight.w400),),
             SizedBox(height: 10,),
             SpinKitWave(
            color: Colors.black,
            size: 50.0,
          ),
           ],
         ),
          ),
      ),
      backgroundColor: Colors.cyan[300],
      );

  }
}

