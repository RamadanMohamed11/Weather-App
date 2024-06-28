import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/card_weather_widget.dart';

class ForcastPage extends StatelessWidget {
  List<WeatherModel> weatherModels;
  ForcastPage({super.key, required this.weatherModels});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
            .weatherModels?[0]
            .condition),
        title: const Text(
          "Weather",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
                    .weatherModels?[0]
                    .condition),
                getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
                    .weatherModels?[0]
                    .condition)[200]!
              ]),
        ),
        child: Center(
          child: Container(
            height: 220,
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModels?[0]
                        .condition)
                    .withOpacity(0.6),
                borderRadius: BorderRadius.circular(12)),
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: weatherModels.length,
                itemBuilder: (context, index) {
                  return Center(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child:
                        CardWeatherWidget(weatherModel: weatherModels[index]),
                  ));
                }),
          ),
        ),
      ),
    );
  }
}
