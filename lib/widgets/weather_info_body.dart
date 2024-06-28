import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/search_widget.dart';
import 'package:weather_app/widgets/weather_cards.dart';
import 'package:weather_app/widgets/weather_info.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weatherModels});
  final List<WeatherModel> weatherModels;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SearchWidget(),
            const SizedBox(
              height: 65,
            ),
            WeatherInfo(
              WeatherModels: weatherModels,
            ),
            const SizedBox(
              height: 30,
            ),
            WeatherCards(
              weatherModels: weatherModels,
            ),
          ],
        ),
      ),
    );
  }
}
