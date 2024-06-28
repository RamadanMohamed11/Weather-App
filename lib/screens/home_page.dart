import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart/get_weather_states.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/screens/splash_screen.dart';
import 'package:weather_app/widgets/private_progress_indicator.dart';
import 'package:weather_app/widgets/weather_error_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';
import 'package:weather_app/widgets/weather_initial_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showSplash = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 4), () {
      setState(() {
        _showSplash = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _showSplash
        ? const SplashScreen()
        : BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return Scaffold(
                  appBar: AppBar(
                    backgroundColor: getThemeColor(
                        BlocProvider.of<GetWeatherCubit>(context)
                            .weatherModels?[0]
                            .condition),
                    title: const Text(
                      "Weather",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    centerTitle: true,
                    elevation: 0,
                  ),
                  body: BlocBuilder<GetWeatherCubit, WeatherState>(
                    builder: (context, state) {
                      if (state is WeatherInitialState) {
                        return const WeatherInitialBody();
                      } else if (state is WeatherProgressState) {
                        return Container(
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    getThemeColor(
                                        BlocProvider.of<GetWeatherCubit>(
                                                context)
                                            .weatherModels?[0]
                                            .condition),
                                    getThemeColor(
                                        BlocProvider.of<GetWeatherCubit>(
                                                context)
                                            .weatherModels?[0]
                                            .condition)[200]!
                                  ]),
                            ),
                            child: const Column(
                              children: [
                                Spacer(),
                                PrivateProgessIndicator(),
                                Spacer(),
                              ],
                            ));
                      } else if (state is WeatherInfoState) {
                        return Container(
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  getThemeColor(
                                      BlocProvider.of<GetWeatherCubit>(context)
                                          .weatherModels?[0]
                                          .condition),
                                  getThemeColor(
                                      BlocProvider.of<GetWeatherCubit>(context)
                                          .weatherModels?[0]
                                          .condition)[200]!
                                ]),
                          ),
                          child: WeatherInfoBody(
                            weatherModels: state.weatherModels,
                          ),
                        );
                      } else if (state is WeatherErrorState) {
                        return const WeatherErrorBody(
                          errorMessage: "There is an error, try later.",
                        );
                      } else {
                        return const Placeholder();
                      }
                    },
                  ));
            },
          );
  }
}
