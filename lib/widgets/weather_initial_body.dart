import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/widgets/search_widget.dart';

class WeatherInitialBody extends StatelessWidget {
  const WeatherInitialBody({super.key});

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
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Search for a city",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                )),
            SizedBox(
              height: 25,
            ),
            Center(
              child: SearchWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
