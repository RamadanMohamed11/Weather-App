import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfo extends StatelessWidget {
  List<WeatherModel> WeatherModels;
  WeatherInfo({super.key, required this.WeatherModels});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  WeatherModels[0].cityName,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                const Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 40,
                ),
              ],
            ),
            Text(
              WeatherModels[0].country,
              style: const TextStyle(color: Colors.white, fontSize: 23),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Column(
          children: [
            Text(
              "MinTemp : ${WeatherModels[0].minTemp}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "MaxTemp : ${WeatherModels[0].maxTemp}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  WeatherModels[0].condition,
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                ),
                Text(
                  "${WeatherModels[0].avgTemp}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              width: 25,
            ),
            Image.network("https:${WeatherModels[0].iconTitle}")
          ],
        )
      ],
    );
  }
}
