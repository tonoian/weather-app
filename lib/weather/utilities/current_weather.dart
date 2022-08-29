import 'package:flutter/material.dart';

Widget currentWeather(
  IconData icon,
  String temp,
  String location,
) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.orange,
          size: 108,
        ),
        SizedBox(
          child: Text(
            temp,
            style: const TextStyle(
              fontSize: 46.0,
            ),
          ),
        ),
        SizedBox(
          child: Text(
            location,
            style: const TextStyle(
              fontSize: 32.0,
            ),
          ),
        ),
      ],
    ),
  );
}
