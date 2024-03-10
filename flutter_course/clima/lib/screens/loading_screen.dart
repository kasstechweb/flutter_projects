import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  void getLocationData() async {
    // Location location = Location();
    // await location.getCurrentLocation();

    // NetworkHelper networkHelper = NetworkHelper(
    //     'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiID&units=imperial');
    // var weatherData = await networkHelper.getData();

    // print('weatherdata: ');
    // print(weatherData);
    var weatherData = await WeatherModel().getLocationWeather();
    if (!context.mounted) return;
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  // void getData() async {
  //   String uri =
  //       'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiID';
  //   // print(latitude);
  //   // print(longitude);
  //   // print(uri);
  //   http.Response response = await http.get(Uri.parse(uri));

  //   if (response.statusCode == 200) {
  //     String data = response.body;
  //     var decodedData = jsonDecode(data);

  //     double temperature = decodedData['main']['temp'];
  //     int condition = decodedData['weather'][0]['id'];
  //     String cityName = decodedData['name'];

  //     print(temperature);
  //     print(condition);
  //     print(cityName);
  //   } else {
  //     print(response.statusCode);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitPulse(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
