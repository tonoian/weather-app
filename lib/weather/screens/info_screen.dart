import 'package:flutter/material.dart';

TextStyle titleFont = const TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 18.0,
);
TextStyle infoFont = const TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 18.0,
);

Widget addInfo(
  String wind,
  String humidity,
  String pressure,
  String feelsLike,
) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(18.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wind',
                  style: titleFont,
                ),
                Text(
                  'Pressure',
                  style: titleFont,
                ),
                Text(
                  'Humidity',
                  style: titleFont,
                ),
                Text(
                  'Feels Like',
                  style: titleFont,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$wind m/s',
                  style: infoFont,
                ),
                Text(
                  '$pressure hPa',
                  style: infoFont,
                ),
                Text(
                  '$humidity %',
                  style: infoFont,
                ),
                Text(
                  '$feelsLike °C',
                  style: infoFont,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
