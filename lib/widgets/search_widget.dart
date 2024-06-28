import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart/get_weather_cubit.dart';
import 'package:weather_app/main.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          fillColor: getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
                  .weatherModels?[0]
                  .condition)
              .withOpacity(0.8),
          filled: true,
          labelText: "Search here...",
          labelStyle: const TextStyle(color: Colors.white),
          hintText: "Enter a city name",
          suffixIcon: const Icon(Icons.search),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.blue, width: 2)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
      onSubmitted: (value) {
        var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);

        try {
          getWeatherCubit.getWeather(value);
        } on Exception catch (e) {
          throw (e.toString());
        }
      },
    );
  }
}
