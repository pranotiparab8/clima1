import 'package:clima1/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    print('this line of code is triggered');
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    Response response = await get(
        "https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22"
            as Uri);
    print(response.body);
  }

  // void somethingThatExpectsLessThan10(int n) {
  //   if (n > 10) {
  //     throw 'n is greater than 10, n should always be less than 10.';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
