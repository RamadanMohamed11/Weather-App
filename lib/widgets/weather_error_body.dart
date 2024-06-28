import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart/get_weather_cubit.dart';
import 'package:weather_app/main.dart';

class WeatherErrorBody extends StatelessWidget {
  final String errorMessage;
  const WeatherErrorBody({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              errorMessage,
              style: TextStyle(color: (Colors.red).withRed(100), fontSize: 30),
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  var getWeatherCubit =
                      BlocProvider.of<GetWeatherCubit>(context);
                  getWeatherCubit.getWeatherInitalState();
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(1000, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: Colors.green),
                child: const Text(
                  "Try Again",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ))
          ],
        ),
      ),
    );
  }
}
