import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../model/weather_model.dart';
import '../services/weather_api.dart';
import '../screens/info_screen.dart';
import '../utilities/current_weather.dart';
import 'package:carbon_icons/carbon_icons.dart';
import '../services/location.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherApi client = WeatherApi();
  Weather? data;

  Future<void> getData() async {
    Location loc = Location();
    print("Success");
    await loc.getCurrentLocation();
    // print("${loc.latitude} ${loc.longitude}");
    data = await client.getCurrentWeather(loc.longitude, loc.latitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          "Weather App",
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                currentWeather(getIcon(data!.condition), "${data!.temp}°C",
                    "${data!.cityName}"),
                Column(
                  children: [
                    const Text(
                      "Additional Information",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    addInfo("${data!.wind}", "${data!.humidity}",
                        "${data!.pressure}", "${data!.feelsLike}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () async {

                      },
                      child: const Icon(
                        CarbonIcons.location,
                        color: Colors.orange,
                        size: 50.0,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {

                      },
                      child: const Icon(
                        CarbonIcons.globe,
                        color: Colors.orange,
                        size: 50.0,
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SpinKitSpinningLines(
                color: Colors.orange,
                size: 100,
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

IconData getIcon(int condition) {
  if (condition < 300) {
    return CarbonIcons.lightning;
  } else if (condition < 400) {
    return CarbonIcons.rain_heavy;
  } else if (condition < 600) {
    return CarbonIcons.umbrella;
  } else if (condition < 700) {
    return CarbonIcons.snowflake;
  } else if (condition < 800) {
    return CarbonIcons.fog;
  } else if (condition == 800) {
    return CarbonIcons.sun;
  } else if (condition <= 804) {
    return CarbonIcons.cloud;
  } else {
    return CarbonIcons.error;
  }
}
