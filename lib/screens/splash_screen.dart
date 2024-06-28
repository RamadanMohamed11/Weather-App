import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart/get_weather_cubit.dart';
import 'package:weather_app/main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: const Center(
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 105,
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage("assets/images/rain.gif"),
            ),
          ),
        ),
      ),
    );
  }
}
