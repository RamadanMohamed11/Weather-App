import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/forecast_page.dart';

class ForecaseButton extends StatelessWidget {
  List<WeatherModel> weatherModels;
  ForecaseButton({super.key, required this.weatherModels});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ForcastPage(
            weatherModels: weatherModels,
          );
        }));
      },
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModels?[0]
                      .condition)
              .withOpacity(0.8),
          fixedSize: const Size(800000, 50)),
      child: const Text(
        "10 days forecast",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
      ),
    );
  }
}
