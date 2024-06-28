import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/card_weather_widget.dart';
import 'package:weather_app/widgets/forecast_button.dart';

class WeatherCards extends StatelessWidget {
  List<WeatherModel> weatherModels;
  WeatherCards({super.key, required this.weatherModels});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
                  .weatherModels?[0]
                  .condition)
              .withOpacity(0.6),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          ForecaseButton(
            weatherModels: weatherModels,
          ),
          const SizedBox(
            height: 10,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     CardWeatherWidget(
          //       weatherModel: weatherModels[0],
          //     ),
          //     CardWeatherWidget(
          //       weatherModel: weatherModels[1],
          //     ),
          //     CardWeatherWidget(
          //       weatherModel: weatherModels[2],
          //     )
          //   ],
          // ),
          SizedBox(
            height: 210,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CardWeatherWidget(
                      weatherModel: weatherModels[index],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
