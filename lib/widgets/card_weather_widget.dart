import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class CardWeatherWidget extends StatelessWidget {
  WeatherModel weatherModel;
  CardWeatherWidget({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
      decoration: BoxDecoration(
          color: getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
              .weatherModels?[0]
              .condition),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("${weatherModel.dayDate[8]}${weatherModel.dayDate[9]}",
              style: const TextStyle(color: Colors.white, fontSize: 25)),
          const SizedBox(
            height: 5,
          ),
          Text(
            weatherModel.condition,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
          const SizedBox(
            height: 5,
          ),
          Image.network("https:${weatherModel.iconTitle}"),
          const SizedBox(
            height: 5,
          ),
          Text(
            "${weatherModel.avgTemp}",
            style: const TextStyle(color: Colors.white, fontSize: 25),
          )
        ],
      ),
    );
  }
}
